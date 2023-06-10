terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "sa-east-1"
  
  access_key                  = "fake"
  secret_key                  = "fake"
  
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    dynamodb = "http://localhost:4566"
    lambda   = "http://localhost:4566"
    kinesis  = "http://localhost:4566"
    sqs      = "http://localhost:4566"
    ssm      = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
  }

}