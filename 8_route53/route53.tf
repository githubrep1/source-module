/*terraform {
  backend "s3" {
    encrypt=true
    bucket = "devopsmonkss-terraform-state-storage"
    dynamodb_table = "devopsmonks-terraform-state-lock"
    key    = "8_route53.tfstate"
    region = "eu-west-1"
  }
}*/


resource "aws_route53_zone" "devopsmonks" {
   name = var.route53_name
}
resource "aws_route53_record" "server1-record" {
   zone_id = "${aws_route53_zone.devopsmonks.zone_id}"
   /*name = "server1.devopsmonks"*/
  name = var.route53_server_record
   type = "A"
   ttl = "300"
   records = ["104.236.247.8"]
}
resource "aws_route53_record" "www-record" {
   zone_id = "${aws_route53_zone.devopsmonks.zone_id}"
   name = var.route53_record_name
   type = "A"
   ttl = "300"
   records = ["104.236.247.8"]
}
resource "aws_route53_record" "mail1-record" {
   zone_id = "${aws_route53_zone.devopsmonks.zone_id}"
   name = var.route53_mail_record_name
   type = "MX"
   ttl = "300"
   records = [
     "1 aspmx.l.google.com.",
     "5 alt1.aspmx.l.google.com.",
     "5 alt2.aspmx.l.google.com.",
     "10 aspmx2.googlemail.com.",
     "10 aspmx3.googlemail.com."
   ]
}

output "ns-servers" {
   value = "${aws_route53_zone.devopsmonks.name_servers}"
}
