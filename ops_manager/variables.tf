variable "count" {}

variable "optional_count" {}

variable "env_name" {}

variable "ami" {}

variable "optional_ami" {}

variable "instance_type" {}

variable "subnet_id" {}

variable "vpc_id" {}

variable "iam_user_name" {}

variable "dns_suffix" {}

variable "zone_id" {}

variable "elb_security_group_id" {}

variable "subnet_ids" {
  type = "list"
}