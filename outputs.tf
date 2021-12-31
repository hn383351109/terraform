output "vpc_id" {
  value = "${aws_vpc.hn-test.id}"
}

output "aws_internet_gateway" {
  value = "${aws_internet_gateway.hn-test.id}"
}


output "aws_eip" {
  value = "${join(aws_eip.hn-test.*.id)}"
}

output "aws_nat_gateway" {
  value = "${aws_nat_gateway.hn-test.id}"
}

output "aws_subnet" {
  value = "${join(aws_subnet.public.*.id)}"
}

output "aws_subnet" {
  value = "${join(aws_subnet.private.*.id)}"
}

output "aws_route_table" {
  value = "${join(aws_route_table.pubilc.*.id)}"
}

output "aws_route_table_association" {
  value = "${join(aws_route_table_association.public.*.id)}"
}

output "aws_route_table" {
  value = "${join(aws_route_table.private.*.id)}"
}

output "aws_route_table_association" {
  value = "${join(aws_route_table_association.private.*.id)}"
}
