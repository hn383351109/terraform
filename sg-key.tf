#创建自定义安全组,端口配置在variables.tf变量文件中配置
resource "aws_security_group" "hn-test" {
  name        = "security-test"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hn-test.id

  ingress {
    from_port        = var.server_port.443
    to_port          = var.server_port.443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_group-hn-test"
  }
}

#创建秘钥对
#resource "aws_key_pair" "hn-test" {
#  key_name   = "${var.ssh_key.key_name}"
#  public_key = "${var.ssh_key.public_key}"
#
#  tags = {
#    Name = "hn-test"
#  }
#}
