terraform {
  backend "s3" {
    bucket = "wwt-state-bucket"
    key    = "state-files/awx"
    region = "us-west-1"
  }
}