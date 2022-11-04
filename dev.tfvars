aws-region      = "us-west-2"
ami-id          = "ami-017fecd1353bcc96e"
vpc-cidr        = "192.168.0.0/16"
vpc-name        = "ntiervpc"
public-subnets  = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
private-subnets = ["192.168.4.0/24", "192.168.5.0/24"]
web-trigger     = "1.0"
