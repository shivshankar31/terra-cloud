terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    # random = {
    #   source  = "hashicorp/random"
    #   version = "3.1.0"
    # }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.84.0"
    }
  }
}

# terraform {
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "my-terra-backup"
#     key    = "backup"
#     region = "us-east-1"

#     dynamodb_table = "terra-lock"
#     encrypt        = true
#   }
# }


# terraform {
#   backend "http" {
#     address        = "http://localhost:5000/terraform_state/my_state"
#     lock_address   = "http://localhost:5000/terraform_lock/my_state"
#     lock_method    = "PUT"
#     unlock_address = "http://localhost:5000/terraform_lock/my_state"
#     unlock_method  = "DELETE"
#   }
# }



terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "terra-study-31"
    workspaces {
      name = "my-aws-app"
    }

  }
}
