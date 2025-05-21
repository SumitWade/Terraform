#workspace for ec2

provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0f5d1713c9af4fe30"
    instance_type = "t2.medium"
    key_name = "syndney-key"

    tags = {
      Env = terraform.workspace
      Name = "my_instance"
    }
  
}


#loops in terraform
#for_each loop for change instance type
provider "aws" {
    region = "ap-southeast-2"
  
}
resource "aws_instance" "my_instance" {
    for_each = var.instance_type
    ami = "ami-0f5d1713c9af4fe30"
    instance_type = each.value
    key_name = "syndney-key"

    tags = {
      Name = "instance-$(each.key)"
      Env = terraform.workspace
    }
  
}

variable "instance_type" {
    default = {
        small = "t2.small"
        micro = "t2.micro"
        large = "t2.large"

    }
  
}

#for_each loop for change instance type and ami 

provider "aws" {
  region = "ap-southeast-2"
}

variable "instances" {
  default = {
    small = {
      instance_type = "t2.small"
      ami           = "ami-0f5d1713c9af4fe30"
    }
    micro = {
      instance_type = "t2.micro"
      ami           = "ami-0a76dcfc18d9c5684"
    }
    large = {
      instance_type = "t2.large"
      ami           = "ami-00a5ea6397b638ec6"
    }
  }
}

resource "aws_instance" "my_instance" {
  for_each      = var.instances
  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = "syndney-key"

  tags = {
    Name = "${terraform.workspace}-instance-${each.key}"
    Env  = terraform.workspace
  }
}

#for_each loop for change different security group
provider "aws" {
  region = "ap-southeast-2"
}


variable "instances" {
  default = {
    small = {
      instance_type = "t2.small"
      ami           = "ami-0f5d1713c9af4fe30"
      sg_id         = "sg-0a4d214dd9a89631e"  
    }
    micro = {
      instance_type = "t2.micro"
      ami           = "ami-0a76dcfc18d9c5684"
      sg_id         = "sg-0c5577ab594d2ec70"  
    }
    large = {
      instance_type = "t2.large"
      ami           = "ami-00a5ea6397b638ec6"
      sg_id         = "sg-01acbc20252eccb8a"  
    }
  }
}


resource "aws_instance" "my_instance" {
  for_each      = var.instances
  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = "syndney-key"

  vpc_security_group_ids = [each.value.sg_id]

  tags = {
    Name = "${terraform.workspace}-instance-${each.key}"
    Env  = terraform.workspace
  }
}
