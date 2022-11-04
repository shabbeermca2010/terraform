resource "aws_security_group" "rdsDBsg"  {
    description = "DB security group"
    ingress   {
      cidr_blocks = [ local.address ]
      description = "open mySQL-DB"
      from_port = local.mysql_port
      protocol = local.tcp  
      to_port = local.mysql_port
    } 
    vpc_id = module.myvpc.vpc_id
    depends_on = [
      module.myvpc
    ]
    tags = {
      Name = "open-mySQL"
    }

}
resource "aws_security_group" "websg"  {
    description = "web security group"
    ingress   {
      cidr_blocks = [ local.address ]
      description = "open http"
      from_port = local.http_port
      protocol = local.tcp  
      to_port = local.http_port
    } 
    ingress   {
      cidr_blocks = [ local.address ]
      description = "open ssh"
      from_port = local.ssh_port
      protocol = local.tcp  
      to_port = local.ssh_port
    } 
    ingress   {
      cidr_blocks = [ local.address ]
      description = "openhttps"
      from_port = local.https_port
      protocol = local.tcp  
      to_port = local.https_port
    } 
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    vpc_id = module.myvpc.vpc_id
    depends_on = [
      module.myvpc
    ]
    tags = {
      Name = "open-for http and ssh"
    }

}
