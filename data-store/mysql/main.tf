terraform {
  backend "s3" {
    profile = "prod"
    key     = "${var.env}/data-stores/mysql/terraform.tfstate"
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = var.database-name
  username          = local.credentials["db_username"]
  password          = local.credentials["db_password"]
}

// This block retrieves the credentials from AWS secret manager in a json format
data "aws_secretsmanager_secret_version" "credential" {
  secret_id = "mysql-master-credential-stage"
}
// Parses the credentials JSON -> dict to be used by the rest of the code
locals {
  credentials = jsondecode(data.aws_secretsmanager_secret_version.credential.secret_string)
}
























