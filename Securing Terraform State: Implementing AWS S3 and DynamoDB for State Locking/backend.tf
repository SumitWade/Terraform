terraform {
  backend "s3" {
    bucket = "my-bakula-tf001"
    key = "syndney-key"
    region = "ap-southeast-2"
    dynamodb_table = "my-dytable-001"
    
  }
}