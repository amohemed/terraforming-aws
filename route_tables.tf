resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }
}

resource "aws_route_table_association" "route_public_subnets" {
  count          = "${length(var.availability_zones)}"
  subnet_id      = "${aws_subnet.public_subnets.1.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route_table" "private_route_table" {
  count  = "${length(var.availability_zones)}"
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }
}

resource "aws_route_table_association" "route_management_subnets" {
  count          = "${length(var.availability_zones)}"
  subnet_id      = "${element(aws_subnet.management_subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_route_table.*.id, count.index)}"
}

resource "aws_route_table_association" "route_ert_subnets" {
  count          = "${length(var.availability_zones)}"
  subnet_id      = "${element(aws_subnet.ert_subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_route_table.*.id, count.index)}"
}

resource "aws_route_table_association" "route_services_subnets" {
  count          = "${length(var.availability_zones)}"
  subnet_id      = "${element(aws_subnet.services_subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_route_table.*.id, count.index)}"
}

resource "aws_route_table" "main_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }

  tags {
    Name = "main"
  }
}

resource "aws_route_table_association" "main_route_public_subnets" {
  subnet_id      = "${aws_subnet.public_subnets.0.id}"
  route_table_id = "${aws_route_table.main_route_table.id}"
}