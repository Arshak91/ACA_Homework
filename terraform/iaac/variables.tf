#Variables
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "route_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}

variable "key_name" {
  type    = string
  default = "Newkeypair"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-007855ac798b5175e"
}
