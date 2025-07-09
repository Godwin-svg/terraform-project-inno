# create vpc
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true 

    tags = {
      Name = "${var.project_name}-vpc"
    }

  
}

# create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
    vpc_id = aws_vpc.vpc.id 

    tags = {
      Name = "${var.project_name}-internet-gateway"
    }
  
}

# create  public az1 route table
resource "aws_route_table" "public_rt_az1" {
    vpc_id = aws_vpc.vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id 
    }
  
}

# create  public az2 route table
resource "aws_route_table" "public_rt_az2" {
    vpc_id = aws_vpc.vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id 
    }
  
}

# used data source to get all the available zones
data "aws_availability_zones" "available_zones" {}

# create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = var.public_subnet_az1_cidr
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available_zones.names[0]

    tags = {
      Name = "${var.project_name}-public_subnet_az1"
    }

  
}

# create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = var.public_subnet_az2_cidr
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available_zones.names[1]

    tags = {
      Name = "${var.project_name}-public_subnet_az2"
    }

  
}

#  create route table association public az1
resource "aws_route_table_association" "public_az1_rt_association" {
    subnet_id = aws_subnet.public_subnet_az1.id 
    route_table_id = aws_route_table.public_rt_az1.id 
  
}

#  create route table association public az2
resource "aws_route_table_association" "public_az2_rt_association" {
    subnet_id = aws_subnet.public_subnet_az2.id  
    route_table_id = aws_route_table.public_rt_az1.id 
  
}

# create private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = var.private_app_subnet_az1_cidr
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available_zones.names[0]

    tags = {
      Name = "${var.project_name}-private_app_subnet_az1"
    }

}

# create private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = var.private_app_subnet_az2_cidr
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available_zones.names[0]

    tags = {
      Name = "${var.project_name}-private_app_subnet_az1"
    }

}

# create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = var.private_data_subnet_az1_cidr
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available_zones.names[0]

    tags = {
      Name = "${var.project_name}-private_data_subnet_az1"
    }

}

# create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = var.private_data_subnet_az2_cidr
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available_zones.names[1]

    tags = {
      Name = "${var.project_name}-private_data_subnet_az2"
    }

}

