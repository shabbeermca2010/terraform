# database subnet group
resource "aws_db_subnet_group" "myDBsubnetgroups" {
    tags = {
      Name = "mysqlDB-subnetgroup"
       }
    subnet_ids = [module.myvpc.private_subnets[local.db_subnet_1],
    module.myvpc.private_subnets[local.db_subnet_2]]
    depends_on = [
            module.myvpc,aws_security_group.rdsDBsg
    ]
}
   
resource "aws_db_instance" "mySQLdb" {
  allocated_storage    = 20
  db_name              = "givetheuniquename"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "root"
  password             = "rootroot"
  skip_final_snapshot  = true
  depends_on = [
    module.myvpc,
    aws_db_subnet_group.myDBsubnetgroups
  ]
  vpc_security_group_ids = [aws_security_group.rdsDBsg.id]
  db_subnet_group_name = aws_db_subnet_group.myDBsubnetgroups.name
}
