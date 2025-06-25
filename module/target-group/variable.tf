# Target Group Name
variable "name" {
  description = "Name of the target group"
  type        = string
}

# Port for Target Group
variable "target_group_port" {
  description = "Port on which targets receive traffic"
  type        = number
}

# Protocol for Target Group
variable "target_group_protocol" {
  description = "Protocol for routing traffic to the targets (e.g., HTTP or HTTPS)"
  type        = string
}

# VPC ID
variable "vpc_id" {
  description = "ID of the VPC for the target group"
  type        = string
}


variable "target_type" {
  type = string
}


# Health Check Path
variable "health_check_path" {
  description = "The destination for the health check request"
  type        = string
}

# Health Check Protocol
variable "health_check_protocol" {
  description = "The protocol to use for health checks (HTTP, HTTPS)"
  type        = optional(string)
}

# Health Check Interval
variable "health_check_interval" {
  description = "Approximate interval, in seconds, between health checks"
  type        = optional(number)
}

# Health Check Timeout
variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = optional(number)
}

# Healthy Threshold Count
variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = optional(number)
}

# Unhealthy Threshold Count
variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering a target unhealthy"
  type        = optional(number)
}

variable "healthCheckEnabled" {
  description = "The health check should be enabled to true or false"
  type        = optional(bool)
}

variable "tags" {
  type = map(string)
}

# Health Check Port
variable "health_check_port" {
  description = "Configure Health Check Port "
  type        = string
}

variable "deregistration_delay" {
  description = "Elastic Load Balancing to wait before changing the state of a deregistering target"
  type        = number
}

variable "slow_start_duruation" {
  description = "Amount time for targets to warm up before the load balancer sends them a full share of requests"
  type        =  optional(number)
}

variable "stickiness_type" {
  description = "type of the stickiness"
  type        = optional(string)
}

variable "stickiness_enabled" {
  description = "enable or disable stickiness"
  type        = optional(bool)
}

variable "cookie_duration" {
  description = "duruation of the coikie"
  type        = optional(number)
}

variable "successCode_matcher" {
  description = "HTTP or gRPC codes to use when checking for a successful response from a target"
  type        = optional(string)
}

variable "cookie_name" {
  description = "Name of the load balancer cookie"
  type        = optional(string)
}

variable "lambda_multi_value_headers_enabled" {
  type = optional(bool)
}

variable "proxy_protocol_v2" {
  type = optional(bool)
}
