#variables
variable "security_group_ids" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs across Availability Zones"
  type        = list(string)
}

variable "name" {
  type = string
}

variable "load_balancer_type" {
  type = string
}

variable "ip_address_type" {
  type = string
}

variable "idle_timeout" {
  type = number
}

variable "internal" {
  description = "Client keep alive value in seconds. The valid range is 60-604800 seconds. The default is 3600 seconds."
  type        = bool
}

variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers. Defaults to `true`"
  type        = bool
}

variable "tags" {
  description = "Tags of load balancers"
  type        = map(string)
}

variable "enable_deletion_protection" {
  type = bool
}
