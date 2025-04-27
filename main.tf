#EC2 instance module
module "ec2-instances" {
  source   = "./module/ec2-instances"
  for_each = { for instance in var.ec2_instance_configuration.ec2_instance_details : instance.name => instance }

  name = each.key

  ami                                  = each.value.ami
  instance_type                        = each.value.instance_type
  volume_size                          = each.value.volume_size
  volume_type                          = each.value.volume_type
  availability_zone                    = each.value.availability_zone
  subnet_ids                           = each.value.subnet_ids
  vpc_security_group_ids               = each.value.vpc_security_group_ids
  delete_on_termination                = each.value.delete_on_termination
  disable_api_termination              = each.value.disable_api_termination
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  monitoring                           = each.value.monitoring
  associate_public_ip_address          = each.value.associate_public_ip_address
  encrypted                            = each.value.encrypted
  key_name                             = each.value.key_name
  

}
