# data.tf (at the root of your repository)

# Data source to fetch the VPC
# Since tag names cannot be used and there will be only one VPC in the lab account,
# we will attempt to find the VPC that is in an 'available' state.
# IMPORTANT: This assumes there is ONLY ONE VPC in the AWS account that is in the 'available' state.
# If there are multiple VPCs in the 'available' state, this data source will fail with an error.
data "aws_vpc" "selected_vpc" {
  filter {
    name   = "state"
    values = ["available"]
  }
}

# Data source to fetch subnets within the selected VPC
# This will attempt to find subnets within the identified VPC that are tagged as 'Type' = 'public'.
# Adjust the 'values' to match your subnet tagging strategy (e.g., 'public', 'private', or specific names).
data "aws_subnets" "selected_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }
  # Default: Filter for public subnets (assuming a tag 'Type' = 'public')
  filter {
    name   = "tag:Type"
    values = ["public"] # Default: Assumes your public subnets are tagged with Type = "public"
  }
  # If you need to select specific subnets, you might add more filters or
  # use a `for_each` loop in your module call if multiple instances are needed.
}

