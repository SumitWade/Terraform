provider "aws" {
  region = "ap-southeast-2"  
}

resource "aws_instance" "my_instance" {
  ami             = "ami-07ba57196a766fc6d"
  instance_type   = "t2.micro"
  key_name        = "syndney-key"
  security_groups = ["default"]  

  tags = {
    Name = "My-Terra-Instance"
  }



provisioner "file" {
  source      = "./script.sh"
  destination = "/tmp/script.sh"

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }
}
provisioner "local-exec" {
        command = "echo hurray! Instance Launched: ${self.public_ip} > new.txt"
    }


 provisioner "remote-exec" {
        inline = [
            "sudo -i",
            "bash /tmp/script.sh"
        ]
        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("~/.ssh/id_rsa")
            host = self.public_ip
        }
    }


}
