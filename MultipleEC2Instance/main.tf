resource "aws_instance" "instance" {
  for_each =  var.ec2_foreach
  ami = var.ec2_emi
  instance_type = each.value.instance_type

  tags = {
    Name = each.key
  }

}