terraform {
    required_version = ">= 0.12.7"
    required_providers {
        aws = {
        source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "${var.region}"
}
resource "aws_dynamodb_table" ""{
    name = ""
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "sourceS3Bucket"
    range_key = "sourceS3Key"
    attribute {
      name = "sourceS3Bucket"
      type = "S"
    }
    
    attribute {
      name = "sourceS3Key"
      type = "S"
    }
      
    ttl {
      attribute_name = "TTL"
      enabled = true   
    }
    
    local_secondary_index {
      name = "idx_sf_example_db"
      projection_type = "INCLUDE"
      range_key = "sourceS3Key"
      non_key_attributes = ["sourceS3Version", "TTL", "sourceFileExtension", "receivebatchId", "receiveNumberOfTimes", "receiveDateTime", "sourceLastModified", "sourceFileSize", "payload" ]
    }
}
