module "data_ec2_module" {

 source = "./data_ec2module"

 Name = "Helloworld"

 AWS_REGION = "eu-west-2"

 instance_type = "t2.micro"

 AWS_PROFILE = "terraform"
 
}
