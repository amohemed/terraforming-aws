resource "aws_security_group" "nat_security_group" {
  name        = "nat_security_group"
  description = "NAT Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  egress {
    cidr_blocks = [
      "52.92.16.0/20",
      "52.216.0.0/15",
      "54.231.0.0/17"
    ]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  ingress {
    cidr_blocks = [
      "52.92.16.0/20",
      "52.216.0.0/15",
      "54.231.0.0/17"
    ]
    protocol = "-1"
    from_port = 0
    to_port = 0
  }

  tags {
    Name = "${var.env_name}-nat-security-group"
  }
}

resource "aws_security_group" "vms_security_group" {
  name        = "vms_security_group"
  description = "VMs Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name = "${var.env_name}-vms-security-group"
  }
}

resource "aws_security_group" "mysql_security_group" {
  name        = "mysql_security_group"
  description = "MySQL Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
  }

  egress {
    cidr_blocks = ["10.0.0.0/16"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name = "${var.env_name}-mysql-security-group"
  }
}

resource "aws_security_group" "elb_security_group" {
  name        = "elb_security_group"
  description = "ELB Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 4443
    to_port     = 4443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name = "${var.env_name}-elb-security-group"
  }
}

resource "aws_security_group" "isoseg_elb_security_group" {
  name        = "isoseg_elb_security_group"
  description = "Isoseg ELB Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 4443
    to_port     = 4443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name = "${var.env_name}-isoseg-elb-security-group"
  }
}

resource "aws_security_group" "ssh_elb_security_group" {
  name        = "ssh_elb_security_group"
  description = "ELB SSH Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 2222
    to_port     = 2222
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name = "${var.env_name}-ssh-elb-security-group"
  }
}

resource "aws_security_group" "tcp_elb_security_group" {
  name        = "tcp_elb_security_group"
  description = "ELB TCP Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.env_name}-tcp-elb-security-group"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 1024
    to_port     = 1123
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name = "${var.env_name}-tcp-elb-security-group"
  }
}

resource "aws_security_group" "amazon-us-east1-security-group-1" {
  name        = "amazon_us_east_1_security_group_1"
  description = "Amazon US East 1 Security Group 1"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.env_name}-amazon-us-east-1-security-group-1"
  }

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [
      "23.20.0.0/14",
      "34.192.0.0/12",
      "34.224.0.0/12",
      "35.168.0.0/13",
      "50.16.0.0/15",
      "50.19.0.0/16",
      "52.0.0.0/15",
      "52.2.0.0/15",
      "52.4.0.0/14",
      "52.20.0.0/14",
      "52.44.0.0/15",
      "52.54.0.0/15",
      "52.70.0.0/15",
      "52.72.0.0/15",
      "52.86.0.0/15",
      "52.90.0.0/15",
      "52.92.16.0/20",
      "52.93.1.0/24",
      "52.93.3.0/24",
      "52.93.4.0/24",
      "52.94.0.0/22",
      "52.94.192.0/22",
      "52.94.224.0/20",
      "52.94.240.0/22",
      "52.94.244.0/22",
      "52.94.248.0/28",
      "52.94.252.0/23",
      "52.94.254.0/23",
      "52.95.48.0/22",
      "52.95.62.0/24",
      "52.95.63.0/24",
      "52.95.108.0/23",
      "52.95.245.0/24",
      "52.95.255.80/28",
      "52.119.196.0/22",
      "52.119.206.0/23",
      "52.119.212.0/23",
      "52.119.214.0/23",
      "52.119.224.0/21",
      "52.119.232.0/21",
      "52.200.0.0/13",
      "52.216.0.0/15",
      "54.80.0.0/13",
      "54.88.0.0/14",
      "54.92.128.0/17",
      "54.144.0.0/14",
      "54.152.0.0/16",
      "54.156.0.0/14",
      "54.160.0.0/13",
      "54.172.0.0/15",
    ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [
      "23.20.0.0/14",
      "34.192.0.0/12",
      "34.224.0.0/12",
      "35.168.0.0/13",
      "50.16.0.0/15",
      "50.19.0.0/16",
      "52.0.0.0/15",
      "52.2.0.0/15",
      "52.4.0.0/14",
      "52.20.0.0/14",
      "52.44.0.0/15",
      "52.54.0.0/15",
      "52.70.0.0/15",
      "52.72.0.0/15",
      "52.86.0.0/15",
      "52.90.0.0/15",
      "52.92.16.0/20",
      "52.93.1.0/24",
      "52.93.3.0/24",
      "52.93.4.0/24",
      "52.94.0.0/22",
      "52.94.192.0/22",
      "52.94.224.0/20",
      "52.94.240.0/22",
      "52.94.244.0/22",
      "52.94.248.0/28",
      "52.94.252.0/23",
      "52.94.254.0/23",
      "52.95.48.0/22",
      "52.95.62.0/24",
      "52.95.63.0/24",
      "52.95.108.0/23",
      "52.95.245.0/24",
      "52.95.255.80/28",
      "52.119.196.0/22",
      "52.119.206.0/23",
      "52.119.212.0/23",
      "52.119.214.0/23",
      "52.119.224.0/21",
      "52.119.232.0/21",
      "52.200.0.0/13",
      "52.216.0.0/15",
      "54.80.0.0/13",
      "54.88.0.0/14",
      "54.92.128.0/17",
      "54.144.0.0/14",
      "54.152.0.0/16",
      "54.156.0.0/14",
      "54.160.0.0/13",
      "54.172.0.0/15",
    ]
  }
}

resource "aws_security_group" "amazon-us-east1-security-group-2" {
  name        = "amazon_us_east_1_security_group_2"
  description = "Amazon US East 1 Security Group 2"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.env_name}-amazon-us-east-1-security-group-2"
  }

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [
      "54.174.0.0/15",
      "54.196.0.0/15",
      "54.198.0.0/16",
      "54.204.0.0/15",
      "54.208.0.0/15",
      "54.210.0.0/15",
      "54.221.0.0/16",
      "54.224.0.0/15",
      "54.226.0.0/15",
      "54.231.0.0/17",
      "54.231.244.0/22",
      "54.234.0.0/15",
      "54.236.0.0/15",
      "54.239.0.0/28",
      "54.239.8.0/21",
      "54.239.16.0/20",
      "54.239.98.0/24",
      "54.239.104.0/23",
      "54.239.108.0/22",
      "54.240.196.0/24",
      "54.240.202.0/24",
      "54.240.208.0/22",
      "54.240.216.0/22",
      "54.240.228.0/23",
      "54.240.232.0/22",
      "54.242.0.0/15",
      "67.202.0.0/18",
      "72.21.192.0/19",
      "72.44.32.0/19",
      "75.101.128.0/17",
      "107.20.0.0/14",
      "172.96.97.0/24",
      "174.129.0.0/16",
      "176.32.96.0/21",
      "176.32.120.0/22",
      "184.72.64.0/18",
      "184.72.128.0/17",
      "184.73.0.0/16",
      "204.236.192.0/18",
      "205.251.224.0/22",
      "205.251.240.0/22",
      "205.251.244.0/23",
      "205.251.247.0/24",
      "205.251.248.0/24",
      "207.171.160.0/20",
      "207.171.176.0/20",
      "216.182.224.0/20"
      ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [
      "54.174.0.0/15",
      "54.196.0.0/15",
      "54.198.0.0/16",
      "54.204.0.0/15",
      "54.208.0.0/15",
      "54.210.0.0/15",
      "54.221.0.0/16",
      "54.224.0.0/15",
      "54.226.0.0/15",
      "54.231.0.0/17",
      "54.231.244.0/22",
      "54.234.0.0/15",
      "54.236.0.0/15",
      "54.239.0.0/28",
      "54.239.8.0/21",
      "54.239.16.0/20",
      "54.239.98.0/24",
      "54.239.104.0/23",
      "54.239.108.0/22",
      "54.240.196.0/24",
      "54.240.202.0/24",
      "54.240.208.0/22",
      "54.240.216.0/22",
      "54.240.228.0/23",
      "54.240.232.0/22",
      "54.242.0.0/15",
      "67.202.0.0/18",
      "72.21.192.0/19",
      "72.44.32.0/19",
      "75.101.128.0/17",
      "107.20.0.0/14",
      "172.96.97.0/24",
      "174.129.0.0/16",
      "176.32.96.0/21",
      "176.32.120.0/22",
      "184.72.64.0/18",
      "184.72.128.0/17",
      "184.73.0.0/16",
      "204.236.192.0/18",
      "205.251.224.0/22",
      "205.251.240.0/22",
      "205.251.244.0/23",
      "205.251.247.0/24",
      "205.251.248.0/24",
      "207.171.160.0/20",
      "207.171.176.0/20",
      "216.182.224.0/20"
      ]
  }
}

resource "aws_security_group" "s3-us-east1-security-group-1" {
  name        = "s3_us_east_1_security_group_1"
  description = "S3 US East 1 Security Group 1"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.env_name}-s3-us-east-1-security-group-1"
  }

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ "52.92.16.0/20", "52.216.0.0/15", "54.231.0.0/17" ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ "52.92.16.0/20", "52.216.0.0/15", "54.231.0.0/17" ]
  }
}

resource "aws_security_group" "ec2-us-east1-security-group-1" {
  name        = "ec2_us_east_1_security_group_1"
  description = "EC2 US East 1 Security Group 1"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.env_name}-ec2-us-east-1-security-group-1"
  }

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [
      "23.20.0.0/14",
      "34.192.0.0/12",
      "34.224.0.0/12",
      "35.168.0.0/13",
      "50.16.0.0/15",
      "50.19.0.0/16",
      "52.0.0.0/15",
      "52.2.0.0/15",
      "52.4.0.0/14",
      "52.20.0.0/14",
      "52.44.0.0/15",
      "52.54.0.0/15",
      "52.70.0.0/15",
      "52.72.0.0/15",
      "52.86.0.0/15",
      "52.90.0.0/15",
      "52.95.245.0/24",
      "52.95.255.80/28",
      "52.200.0.0/13",
      "54.80.0.0/13",
      "54.88.0.0/14",
      "54.92.128.0/17",
      "54.144.0.0/14",
      "54.152.0.0/16",
      "54.156.0.0/14",
      "54.160.0.0/13",
      "54.172.0.0/15",
      "54.174.0.0/15",
      "54.196.0.0/15",
      "54.198.0.0/16",
      "54.204.0.0/15",
      "54.208.0.0/15",
      "54.210.0.0/15",
      "54.221.0.0/16",
      "54.224.0.0/15",
      "54.226.0.0/15",
      "54.234.0.0/15",
      "54.236.0.0/15",
      "54.242.0.0/15",
      "67.202.0.0/18",
      "72.44.32.0/19",
      "75.101.128.0/17",
      "107.20.0.0/14",
      "174.129.0.0/16",
      "184.72.64.0/18",
      "184.72.128.0/17",
      "184.73.0.0/16",
      "204.236.192.0/18",
      "216.182.224.0/20"
    ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [
      "23.20.0.0/14",
      "34.192.0.0/12",
      "34.224.0.0/12",
      "35.168.0.0/13",
      "50.16.0.0/15",
      "50.19.0.0/16",
      "52.0.0.0/15",
      "52.2.0.0/15",
      "52.4.0.0/14",
      "52.20.0.0/14",
      "52.44.0.0/15",
      "52.54.0.0/15",
      "52.70.0.0/15",
      "52.72.0.0/15",
      "52.86.0.0/15",
      "52.90.0.0/15",
      "52.95.245.0/24",
      "52.95.255.80/28",
      "52.200.0.0/13",
      "54.80.0.0/13",
      "54.88.0.0/14",
      "54.92.128.0/17",
      "54.144.0.0/14",
      "54.152.0.0/16",
      "54.156.0.0/14",
      "54.160.0.0/13",
      "54.172.0.0/15",
      "54.174.0.0/15",
      "54.196.0.0/15",
      "54.198.0.0/16",
      "54.204.0.0/15",
      "54.208.0.0/15",
      "54.210.0.0/15",
      "54.221.0.0/16",
      "54.224.0.0/15",
      "54.226.0.0/15",
      "54.234.0.0/15",
      "54.236.0.0/15",
      "54.242.0.0/15",
      "67.202.0.0/18",
      "72.44.32.0/19",
      "75.101.128.0/17",
      "107.20.0.0/14",
      "174.129.0.0/16",
      "184.72.64.0/18",
      "184.72.128.0/17",
      "184.73.0.0/16",
      "204.236.192.0/18",
      "216.182.224.0/20"
    ]
  }
}
