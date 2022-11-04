# output "getting key pair" {
#   value = data.aws_key_pair.key_name.id
# }
output "url" {
    value = format("http://%s", aws_instance.webec2.public_ip)
}