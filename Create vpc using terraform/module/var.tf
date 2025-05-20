variable "image_id" {
  default = "ami-0b20f6d42c1ad2b5a"
}

variable "key_name" {
  default = "syndney-key"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "cidr_block" {
  default = "10.0.0.0/20"
}
