resource "aws_subnet" "fjfs-subnet1a" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "fjfs-subnet1a"
  }
}

resource "aws_subnet" "fjfs-subnet1b" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "fjfs-subnet1b"
  }
}