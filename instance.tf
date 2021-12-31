resource "aws_instance" "hn-test" {
  count = 2
  ami           = "${var.instance_image_ami.image-i}"
  instance_type = "${var.image_type.t3-micro}"
  key_name = "sim-test"

  subnet_id = "${element(aws_subnet.public.*.id,0)}"
  vpc_security_group_ids = ["${aws_security_group.hn-test.id}"]
}
