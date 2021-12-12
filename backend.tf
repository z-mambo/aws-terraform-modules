terraform {
  backend "s3" {
    bucket = "keen-backend-richie"
    key    = "demostatefile.tfstate"
    region = "us-east-1"
    dynamodb_table = "keen-backend"
  }
}