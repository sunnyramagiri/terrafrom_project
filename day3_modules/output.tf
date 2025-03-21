# for getting the output of public ip address

output "public-ip-address" {
    value = aws_instance.mymodel[0].public_ip
}