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
module "target_groups" { # It's good practice to pluralize the name for for_each modules
  source   = "./module/target-group"
  for_each = { for tg in var.tg_configuration.tg_details : tg.name => tg }

  # Required attributes (always expected in var.json)
  name                   = each.value.name
  target_group_port      = each.value.target_group_port
  target_group_protocol  = each.value.target_group_protocol
  vpc_id                 = each.value.vpc_id
  target_type            = each.value.target_type
  stickiness_enabled     = each.value.stickiness_enabled # If this can also be optional in JSON, use try() here too

  # Optional attributes - use try() to handle cases where they might be missing in var.json
  # If the attribute is missing in each.value, 'try' will return null,
  # allowing the 'default' value in the module's variable definition to take over.

  health_check_enabled               = try(each.value.health_check_enabled, null)
  health_check_interval              = try(each.value.health_check_interval, null)
  health_check_path                  = try(each.value.health_check_path, null)
  health_check_protocol              = try(each.value.health_check_protocol, null)
  health_check_timeout               = try(each.value.health_check_timeout, null)
  healthy_threshold                  = try(each.value.healthy_threshold, null)
  unhealthy_threshold                = try(each.value.unhealthy_threshold, null)
  health_check_port                  = try(each.value.health_check_port, null)
  
  deregistration_delay               = try(each.value.deregistration_delay, null)
  slow_start_duration                = try(each.value.slow_start_duration, null) # Ensure spelling matches var.json and variables.tf
  
  stickiness_type                    = try(each.value.stickiness_type, null)
  cookie_duration                    = try(each.value.cookie_duration, null)
  cookie_name                        = try(each.value.cookie_name, null)
  
  successCode_matcher                = try(each.value.successCode_matcher, null)
  lambda_multi_value_headers_enabled = try(each.value.lambda_multi_value_headers_enabled, null)
  proxy_protocol_v2                  = try(each.value.proxy_protocol_v2, null)

  tags = each.value.tags # Assuming tags are always present
}
