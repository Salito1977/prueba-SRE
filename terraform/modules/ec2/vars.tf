variable "instance_ami" {
  default = "ami-0eea504f45ef7a8f7"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnets" {}

variable "wordpress_sg_id" {}