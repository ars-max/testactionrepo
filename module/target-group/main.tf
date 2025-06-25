#target groups
resource "aws_lb_target_group" "alb_target_group" {
  name                               = var.name
  port                               = var.target_group_port
  protocol                           = var.target_group_protocol
  vpc_id                             = var.vpc_id
  target_type                        = var.target_type
  deregistration_delay               = var.deregistration_delay
  slow_start                         = var.slow_start_duruation
  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  proxy_protocol_v2                  = var.proxy_protocol_v2

  health_check {
    //path                = var.health_check_path
    path                = contains(["HTTP", "HTTPS"], upper(var.health_check_protocol)) ? var.health_check_path : null
    protocol            = var.health_check_protocol
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    enabled             = var.healthCheckEnabled
    port                = var.health_check_port
    matcher             = var.successCode_matcher
  }

  stickiness {
    type            = var.stickiness_type
    enabled         = var.stickiness_enabled
    cookie_duration = var.cookie_duration
    cookie_name     = var.cookie_name
  }

  tags = var.tags
}
