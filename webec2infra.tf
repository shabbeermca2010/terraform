resource "aws_instance" "webec2" {

  ami                         = var.ami-id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "my_id_rsa"
  vpc_security_group_ids      = [aws_security_group.websg.id]
  subnet_id                   = module.myvpc.public_subnets[0]
  tags = {
    Name = "web_ec2"
  }
  depends_on = [
    module.myvpc,
    aws_security_group.websg
  ]

  }
  resource "null_resource" "webprovisoner" {
    triggers = {
      running_number = var.web-trigger
    }

    provisioner "remote-exec" {

      connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host        = aws_instance.webec2.public_ip
      }

      inline = [
        "sudo apt update",
        "sudo apt install nginx -y",
        "sudo apt install tree -y"
      ]


    }
    depends_on = [aws_instance.webec2]

  }
