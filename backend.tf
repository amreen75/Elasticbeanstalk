terraform {
  backend "s3" {
    bucket = "terraform-state-amreen"
    key    = "core/terraform.tfstate"
    region = "eu-west-1"
  }
}
