terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "mybkt-codebuild-19159"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true  # enables state locking without DynamoDB
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Example"
  }
}
