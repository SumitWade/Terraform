provider "aws" {
  region = "ap-southeast-2"  
}

resource "aws_instance" "my_instance" {
  ami             = "ami-0f5d1713c9af4fe30"
  instance_type   = "t2.micro"
  key_name        = "syndney-key"
  security_groups = ["default"]  

  tags = {
    Name = "My-Terra-Instance"
  }
}





resource "aws_instance" "demo_import_instance" {
    instance_type = ""
    ami = ""
}
