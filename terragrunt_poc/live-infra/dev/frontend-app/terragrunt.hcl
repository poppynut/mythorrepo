terraform {
  source = "../../modules/ec2-instance"
}
inputs = {
  instance_type = "t2.micro"
  instance_name = "example-server-thorev"
  ami = "ami-09298640a92b2d12c"
  subnet_id = ""
}