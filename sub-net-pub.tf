resource "aws_subnet" "fjfs-subnet-pub-1a" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-subnet-pub-1a",
      "kubernetes.io/role/elb" = 1
    }
  )
}


resource "aws_subnet" "fjfs-subnet-pub-1b" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-subnet-pub-1b",
      "kubernetes.io/role/elb" = 1
    }
  )
}


resource "aws_route_table_association" "fjfs-public-subnet-1a" {
  subnet_id      = aws_subnet.fjfs-subnet-pub-1a.id
  route_table_id = aws_route_table.eks-public-route-table.id
}


resource "aws_route_table_association" "fjfs-public-subnet-1b" {
  subnet_id      = aws_subnet.fjfs-subnet-pub-1b.id
  route_table_id = aws_route_table.eks-public-route-table.id
}