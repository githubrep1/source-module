# Internet VPC
resource "aws_vpc" "main" {
    
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "main"
        project = "training"
    }
}


# Subnets public

# Create 1 public subnets for each AZ within the regional VPC

resource "aws_subnet" "public" {

  for_each = var.public_subnet_numbers
  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, each.value)
  map_public_ip_on_launch = "true"

 
  tags = {
    Name = "public-subnet"
    # Project     = "cloudcasts.io"
    # Role        = "public"
    # Environment = var.infra_env
    # ManagedBy   = "terraform"
    Subnet      = "${each.key}-${each.value}"
  }
}


# subnets private

# Create 1 private subnets for each AZ within the regional VPC

resource "aws_subnet" "private" {
  for_each = var.private_subnet_numbers
 
  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, each.value)
 
  tags = {
    Name = "private-subnet"
   # Project     = "cloudcasts.io"
   # Role        = "private"
   # Environment = var.infra_env
   # ManagedBy   = "terraform"
    Subnet      = "${each.key}-${each.value}"
  }
}


# Internet GW
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags = {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.main.id}"
    
    tags = {
        Name = "main-public-1"
    }
}

# Public Route
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main-gw.id
}



# route associations public

resource "aws_route_table_association" "public" {
  for_each  = aws_subnet.public
  subnet_id = aws_subnet.public[each.key].id
 
  route_table_id = aws_route_table.public.id
}


