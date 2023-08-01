# Terraform Renote State Datasource : This is going to read the data from another statefile

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "b54-santhosh-terraform-remote-state"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "image" {   // using this we can fetch the latest AMI of the ansilbe-lab-image
  most_recent      = true
  name_regex       = "ansible-lab-image"
  owners           = ["self"]                   // used self because this {ansible-lab-image} ami is in my account if it is other than your account you can remove the self once.
}