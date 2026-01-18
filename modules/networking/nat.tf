resource "aws_eip" "nat" {
    domain = "vpc"
    tags = merge(var.tags, { Name = "${var.name}-nat-eip-${count.index}" })
}

resource "aws_nat_gateway" "this" {
    allocation_id = aws_eip.nat[count.index].id
    subnet_id = aws_subnet.public[count.index].id
    tags = merge(var.tags, { Name = "${var.name}-nat-gateway-${count.index}" })

    depends_on = [aws_internet_gateway.this]
}