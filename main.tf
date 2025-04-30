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
  source   = "./module/Sg_grp"
  for_each = { for sg in var.security_group_config.sg_base_details : sg.name => sg }

  name        = each.key
  description = each.value.description
  vpc_id      = each.value.vpc_id

  security_group_config = {
    ingress_rules_cidr_blocks    = each.value.ingress_rules_cidr_blocks
    ingress_rules_security_group = each.value.ingress_rules_security_group
    egress_rules                 = each.value.egress_rules
  }
 tags                            = each.value.tags
}
