variable "region" {
    default = ""
    description = "AWS Region to deploy to"
}

variable "common-name-value" {
    default = "s"
    description = "Common naming convention for all Terraform created resources"
}

variable "account"{
    default = ""
}
