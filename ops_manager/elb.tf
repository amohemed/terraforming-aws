resource "aws_elb" "opsman_elb" {
  name                      = "${var.env_name}-opsman-elb"
  cross_zone_load_balancing = false
  idle_timeout = 3600

  listener {
    instance_port      = 443
    instance_protocol  = "tcp"
    lb_port            = 443
    lb_protocol        = "tcp"
  }

  listener {
    instance_port      = 443
    instance_protocol  = "tcp"
    lb_port            = 4443
    lb_protocol        = "tcp"
  }

  security_groups = ["${var.elb_security_group_id}"]
  subnets         = ["${var.subnet_ids}"]

  count           = "${var.count}"
  instances       = ["${aws_instance.ops_manager.id}"]
}

resource "aws_elb" "optional_opsman_elb" {
  name                      = "${var.env_name}-opt-opsman-elb"
  cross_zone_load_balancing = false
  idle_timeout = 3600

  listener {
    instance_port      = 443
    instance_protocol  = "tcp"
    lb_port            = 443
    lb_protocol        = "tcp"
  }

  listener {
    instance_port      = 443
    instance_protocol  = "tcp"
    lb_port            = 4443
    lb_protocol        = "tcp"
  }

  security_groups = ["${var.elb_security_group_id}"]
  subnets         = "${var.subnet_ids}"

  count           = "${var.optional_count}"
  instances       = ["${aws_instance.optional_ops_manager.id}"]
}