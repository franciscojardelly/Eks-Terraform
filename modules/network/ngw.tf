resource "aws_eip" "eks-ngw-eip-1a" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-eip-1a"
    }
  )
}


resource "aws_eip" "eks-ngw-eip-1b" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-eip-1b"
    }
  )
}

resource "aws_nat_gateway" "eks-ngw-1a" {
  allocation_id = aws_eip.eks-ngw-eip-1a.id
  subnet_id     = aws_subnet.fjfs-subnet-pub-1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )

}

resource "aws_nat_gateway" "eks-ngw-1b" {
  allocation_id = aws_eip.eks-ngw-eip-1b.id
  subnet_id     = aws_subnet.fjfs-subnet-pub-1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )

}

resource "aws_route_table" "eks-private-route-table-1a" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-private-route-table-1a"
    }
  )
}


resource "aws_route_table" "eks-private-route-table-1b" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-private-route-table-1b"
    }
  )
}