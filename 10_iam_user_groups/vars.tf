variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AWS_PROFILE" {
  default = "terraform"
}
variable "aws_iam_group" {
    default = "administrators"
}    

variable "aws_iam_policy_attachment" {
      default = "administrators-attach"
}

variable "aws_iam_user_1" {
default = "admin1"
}

variable "aws_iam_user_2 {
default = "admin2"
}

variable "aws_iam_group_membership" {
    default = "administrators-users"


}


    

    
    




