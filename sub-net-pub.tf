resource "aws_subnet" "fjfs-subnet1a" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    local.tags,
    {
      Name                     = "fjfs-subnet1a",
      "kubernetes.io/role/elb" = 1
    }
  )
}


resource "aws_subnet" "fjfs-subnet1b" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    local.tags,
    {
      Name                     = "fjfs-subnet1b",
      "kubernetes.io/role/elb" = 1
    }
  )
}