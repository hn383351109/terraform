resource "aws_instance" "hn-test" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  subnet_id = "${element(aws_subnet.public.*.id,0)}"
  vpc_security_group_ids = ["${aws_security_group.hn-test.id}"]
 
}
