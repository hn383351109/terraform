#创建EC2实例,并修改默认EBS卷类型为gp3
resource "aws_instance" "hn-test" {
  count = 2
  ami           = "${var.instance_image_ami.image-i}"
  instance_type = "${var.image_type.t3-micro}"
  key_name = "terraform"

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    delete_on_termination = true
  }

  subnet_id = "${element(aws_subnet.public.*.id,0)}"
  vpc_security_group_ids = ["${aws_security_group.hn-test.id}"]

  tags = {
    Name = "hn-test${count.index}"
  }
}

#创建EIP,并关注EIP到到第一个instance EC2实例上
resource "aws_eip" "hn-test-instance" {
  count = 1
  vpc = true
  instance = "${element(aws_instance.hn-test.*.id,0)}"

  tags = {
    Name = "eip-${var.vpc_name}"
  }
}

#或者通过eip关联的方式将EIP关联到instance实例上
resource "aws_eip_association" "hn-test" {
  instance_id   = "${element(aws_instance.hn-test.*.id,1)}"
  allocation_id = "${element(aws_eip.hn-test.*.id,1)}"
}
