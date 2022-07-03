variable "AWS_REGION" {}
variable "PATH_TO_PUBLIC_KEY" {}

variable "PATH_TO_PRIVATE_KEY" {}

variable "instance_type" {}

variable "AWS_PROFILE" {}

variable "availability_zone" {}
variable "instance_type" {}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0d75513e7706cf2d9" # EU Ireland
    eu-west-2 = "ami-082f73b60cd9b99b2" # EU London
    us-east-1 = "mi-00d4e9ff62bc40e03" # US N.virginia
  }
}
