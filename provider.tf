# Run tokendito first for account `tokendito --profile alfheim_admin`
provider "aws" {
  #region  = var.region
  #alias = "profile" # TODO use for local work
  #profile = "nct-admin"
}

provider "aws" {
  region = var.region
  #assume_role {
    #role_arn     = "arn:aws:iam::${var.aws_configurations.account_id}:role/${var.aws_configurations.assumed_role}"
    #session_name = "terraform_access"
  }
  default_tags {
    tags = var.provider_tags
  }
}
