locals {
  az_a         = format("%sa", var.aws-region)
  az_b         = format("%sb", var.aws-region)
  mysql_port   = 3306
  http_port     = 80
  ssh_port      = 22
  https_port    = 443
  tcp          = "tcp"
  address      = "0.0.0.0/0"
  db_subnet_1  = 0
  db_subnet_2  = 1
  app_subnet_1 = 3
  app_subnet_2 = 4
}
