terraform {
  backend "s3" {
    bucket  = "arstest-tfbackend01"
    key     = "terraform/state" # Path within the bucket to store the state file
    region  = "us-east-1"      # Replace with your AWS region
    # The following are optional, but often recommended:
    # encrypt = true             # Enable server-side encryption
    # dynamodb_table = "terraform-state-lock" # For state locking (see below)
  }
}
