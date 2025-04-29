variable "vpc_id" {
  type = string
  description = "The ID of the VPC"
}

variable "ingress_from_port" {
  type = number
  description = "The starting port for the ingress rule"
}

variable "ingress_to_port" {
  type = number
  description = "The ending port for the ingress rule"
}

variable "ingress_protocol" {
  type = string
  description = "The protocol for the ingress rule (e.g., tcp, udp, icmp)"
}

variable "ingress_cidr_blocks" {
  type = list(string)
  description = "A list of CIDR blocks to allow ingress from"
}

# ... similarly define variables for egress rules ...

variable "tags" {
  type = map(string)
  description = "A map of tags to apply to the security group"
  default = {}
}
