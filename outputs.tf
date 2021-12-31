output "vpc_id" {
  value = "${aws_vpc.hn-test.id}"
}

output "aws_internet_gateway" {
  value = "${aws_internet_gateway.hn-test.id}"
}


output "aws_eip" {
  value = "${join(",", aws_eip.hn-test.*.id)}"
}

output "aws_nat_gateway" {
  value = "${aws_nat_gateway.hn-test.id}"
}

output "aws_subnet_public" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "aws_subnet_private" {
  value = "${join(",", aws_subnet.private.*.id)}"
}
