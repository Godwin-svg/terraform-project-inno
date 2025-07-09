# Create environment 
# project name
output "project_name" {
    value = var.project_name
}

# Region
output "region" {
    value = var.region
}


# public subnet az1 cidr id 
output "public_subnet_az1_cidr" {
    value = aws_subnet.public_subnet_az1.id 
}

# public subnet az2 cidr id 
output "public_subnet_az2_cidr" {
    value = aws_subnet.public_subnet_az2.id   
}

# private app subnet az1 cidr id 
output "private_app_subnet_az1" {
    value = aws_subnet.private_app_subnet_az1.id   
}

# private app subnet az2 cidr id 
output "private_app_subnet_az1_cidr" {
    value = aws_subnet.private_app_subnet_az2.id 
}

# private data subnet az1 cidr
output "private_data_subnet_az1_cidr" {
    value = aws_subnet.private_data_subnet_az1.id 
}

# private data subnet az2 cidr
output "private_data_subnet_az2_cidr" {
    value = aws_subnet.private_data_subnet_az2.id 
  
}

# internet gateway
output "internet-gateway" {
    value = aws_internet_gateway.internet-gateway
  
}