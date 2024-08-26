provider "aws" {
  region = var.region
}

resource "aws_directory_service_directory" "demo_onprem_ad" {
  name     = "onprem.example.com"
  password = "098poiA#"
  edition  = "Standard"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = [var.private_subnet_ips[0] , var.private_subnet_ips[1]]
  }

  tags = {
    Project = "demo"
  }
}