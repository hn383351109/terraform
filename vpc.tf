#创建VPC并定义CIDR,tags定义标签名称
resource "aws_vpc" "hn-test" {
  cidr_block = "10.${var.cidr_numeral}.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name = "vpc-${var.vpc_name}"
  }
}

#创建IGW,并绑定VPC,通过引用vpc id的方式
resource "aws_internet_gateway" "hn-test" {
  vpc_id = aws_vpc.hn-test.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}

#创建EIP,count数量可自定义会根据变量自定义设置
resource "aws_eip" "hn-test" {
  count = "${length(split(",","${var.availability_zones}"))}"
  vpc = true
  
  tags = {
    Name = "eip-${var.vpc_name}"
  }
}

#创建NAT网关,并绑定一个共有子网和一个EIP,使用element函数选择某个子网或EIP
resource "aws_nat_gateway" "hn-test" {
  allocation_id = element(aws_eip.hn-test.*.id,0)
  subnet_id = element(aws_subnet.public.*.id,0)

  tags = {
    Name = "nat-${var.vpc_name}"
  }
}

#创建公有子网,子网数量可根据具体架构进行调整,本次以AZ数量进行创建
resource "aws_subnet" "public" {
  count = "${length(split(",","${var.availability_zones}"))}"
  vpc_id = aws_vpc.hn-test.id

  cidr_block = "10.${var.cidr_numeral}.${lookup(var.cidr_name_public,count.index)}.0/24"
  availability_zone = "${element(split(",","${var.availability_zones}"),count.index)}"

  tags = {
    Name = "subnet_public${count.index}"
  }
}

#创建私有子网,子网数量可根据具体架构进行调整,本次以AZ数量进行创建
resource "aws_subnet" "private" {
  count = "${length(split(",","${var.availability_zones}"))}"
  vpc_id = aws_vpc.hn-test.id

  cidr_block = "10.${var.cidr_numeral}.${lookup(var.cidr_name_private,count.index)}.0/24"
  availability_zone = "${element(split(",","${var.availability_zones}"),count.index)}"

  tags = {
    Name = "subnet_private${count.index}"
  }
}

#创建公有路由表,并关联IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.hn-test.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hn-test.id
  }

  tags = {
    Name = "route-public"
  }
}

#创建子网关联,关联公有路由表与公有子网
resource "aws_route_table_association" "public" {
  count = "${length(split(",","${var.availability_zones}"))}"
  subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
  route_table_id = aws_route_table.public.id
}

#创建私有路由表,并关联NAT
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.hn-test.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.hn-test.id
  }

  tags = {
    Name = "route-private"
  }
}

#创建子网关联,关联私有路由表与私有子网
resource "aws_route_table_association" "private" {
  count = "${length(split(",","${var.availability_zones}"))}"
  subnet_id = "${element(aws_subnet.private.*.id,count.index)}"
  route_table_id = aws_route_table.private.id
}
