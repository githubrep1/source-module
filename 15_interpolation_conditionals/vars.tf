variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/devopsmonks.pem"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/devopsmonks.pub"
}

variable "ENV" {
  default = "prod"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "AWS_PROFILE" {
  default = "terraform"
}