provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
}


module "my-vpc_basics" {
    source = "./module/vpc"
  
}
