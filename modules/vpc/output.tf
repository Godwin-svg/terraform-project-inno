# Create environment 
# project name
output "project_name" {
    value = "var.project_name"
}

# Region
output "region" {
    value = var.region
}

# vpc cidr id
output "vpc_cidr" {
    value = var.vpc_cidr.id  
}

# public subnet az1 cidr id 
output "public_subnet_az1_cidr" {
    value = var.public_subnet_az1_cidr.id 
}

# public subnet az2 cidr id 
output "public_subnet_az2_cidr" {
    value = var.public_subnet_az2_cidr.id  
}

# private app subnet az1 cidr id 
output "private_app_subnet_az1" {
    value = var.private_app_subnet_az1_cidr.id  
}

# private app subnet az2 cidr id 
output "private_app_subnet_az1_cidr" {
    value = var.private_app_subnet_az2_cidr.id 
}

# private data subnet az1 cidr
output "private_data_subnet_az1_cidr" {
    value = var.private_data_subnet_az1_cidr
}

# private data subnet az2 cidr
output "private_data_subnet_az2_cidr" {
    value = var.private_data_subnet_az2_cidr
  
}