variable "AWS_ACCESS_KEY" { }
variable "AWS_SECRET_KEY" { }
variable "AWS_REGION" { }


variable "AMI_ID" {
  default = "ami-093467ec28ae4fe03"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "pemkey"
}