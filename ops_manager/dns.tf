resource "aws_route53_record" "ops_manager" {
  name    = "pcf.${var.env_name}.${var.dns_suffix}"
  zone_id = "${var.zone_id}"
  type    = "CNAME"
  ttl     = 300
  count   = "${var.count}"

  records = ["${aws_elb.opsman_elb.dns_name}"]
}

resource "aws_route53_record" "optional_ops_manager" {
  name    = "pcf-optional.${var.env_name}.${var.dns_suffix}"
  zone_id = "${var.zone_id}"
  type    = "CNAME"
  ttl     = 300
  count   = "${var.optional_count}"

  records = ["${aws_elb.optional_opsman_elb.dns_name}"]
}
