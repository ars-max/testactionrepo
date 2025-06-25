# EC2 instance module
module "ec2-instances" {
  source = "./module/ec2-instances"
  for_each = { for instance in var.ec2_instance_configuration.ec2_instance_details : instance.name => instance }

  name                                     = each.key
  ami                                      = each.value.ami
  instance_type                            = each.value.instance_type
  volume_size                              = each.value.volume_size
  volume_type                              = each.value.volume_type
  availability_zone                        = each.value.availability_zone
  subnet_ids                               = each.value.subnet_ids
  vpc_security_group_ids                   = each.value.vpc_security_group_ids
  delete_on_termination                    = each.value.delete_on_termination
  disable_api_termination                = each.value.disable_api_termination
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  monitoring                               = each.value.monitoring
  associate_public_ip_address              = each.value.associate_public_ip_address
  encrypted                                = each.value.encrypted
  key_name                                 = each.value.key_name
  tags                                     = each.value.tags
}

#Security group
module "Sg_grp" {
  source = "./module/Sg_grp"
  security_group_config = var.security_group_config
}

# Loadbalancer creation
#load-balancer module
module "loadbalncer" {
  source   = "./module/loadbalncer"
  for_each = { for lb in var.lb_configuration.lb_details : lb.name => lb }

  name = each.key

  subnet_ids                 = each.value.subnet_ids
  idle_timeout               = each.value.idle_timeout
  ip_address_type            = each.value.ip_address_type
  load_balancer_type         = each.value.load_balancer_type
  security_group_ids         = each.value.security_group_ids
  internal                   = each.value.internal
  enable_http2               = each.value.enable_http2
  enable_deletion_protection = each.value.enable_deletion_protection
  tags                       = each.value.tags
}
#Target group resource calling
module "target-group" {
  source   = "./modules/target-group"
  for_each = { for tg in var.tg_configuration.tg_details : tg.name => tg }
  vpc_id   = each.value.vpc_id
  name     = each.key

  target_type                        = each.value.target_type
  target_group_port                  = each.value.target_group_port
  health_check_protocol              = each.value.health_check_protocol
  health_check_interval              = each.value.health_check_interval
  health_check_timeout               = each.value.health_check_timeout
  healthy_threshold                  = each.value.healthy_threshold
  unhealthy_threshold                = each.value.unhealthy_threshold
  health_check_path                  = each.value.health_check_path
  healthCheckEnabled                 = each.value.healthCheckEnabled
  health_check_port                  = each.value.health_check_port
  target_group_protocol              = each.value.target_group_protocol
  cookie_duration                    = each.value.cookie_duration
  deregistration_delay               = each.value.deregistration_delay
  slow_start_duruation               = each.value.slow_start_duruation
  stickiness_enabled                 = each.value.stickiness_enabled
  stickiness_type                    = each.value.stickiness_type
  successCode_matcher                = each.value.successCode_matcher
  cookie_name                        = each.value.cookie_name
  lambda_multi_value_headers_enabled = each.value.lambda_multi_value_headers_enabled
  proxy_protocol_v2                  = each.value.proxy_protocol_v2
  tags                               = each.value.tags
}
