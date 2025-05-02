variable "security_group_config" {
  type = list(object({
    name = string
    description = string
    vpc_id = string
    ingress_rules_cidr_blocks = list(object({
      from_port = number
      to_port   = number
      protocol  = string
      cidr_blocks = list(string)
      description = string
    }))
    egress_rules = list(object({
      from_port = number
      to_port   = number
      protocol  = number
      cidr_blocks = list(string)
      description = string
    }))
    tags = map(string)
  }))
  description = "Configuration for security groups"
}
