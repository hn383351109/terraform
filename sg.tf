#创建自定义安全组,端口配置在variables.tf变量文件中配置
resource "aws_security_group" "hn-test" {
  name        = "security-test"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hn-test.id

  ingress {
    from_port        = var.server_port.1
    to_port          = var.server_port.1
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
    Name = "security-hn-test"
  }
}
