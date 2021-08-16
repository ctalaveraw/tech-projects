# Using structural data types allow for the
# use of multiple values of multiple primitive types
# to be grouped together and stored in a variable;
# different primitive types can be mixed and matched.
# These include the `object`,  `set`, and `tuple` data types.

# In the below example, an `object` type has two variables,
# with two different primitive variable types
# `string` and `number`:

variable "instructor" {
    type = object({
        name = string
        age = number
    })
}

# this uses the "any" placeholder if the primitive
# data type is not known.

variable "data" {
    type = list(any)
    default = [5, 7, 68]
}


# an example of a verbose block of code
# that can be consolidated with using
# a dynamic block
resource "aws_security_group" "my-sg" {
    name = "my-aws-security-group"
    vpc_id = aws_vpc.my-vpc.id
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "1.2.3.4/32" ]
    } 
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    } 
}

# created variable for the dynamic block
variable "rules" {
    default = [
        {
            port = 80
            proto = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            port = 22
            proto = "tcp"
            cidrs = ["1.2.3.4/32"]
        }
    ]
}

# dynamic block
resource "aws_security_group" "my-sg" {
    name = "my-aws-security-group"
    vpc_id = aws_vpc.my-vpc.id
    dynamic "ingress" {
        for_each = var.rules
        content {
            from_port = ingress.value["port"]
            to_port = ingress.value["port"]
            protocol = ingress.value["proto"]
            cidr_blocks = ingress.value["cidrs"]
        }
    }
}

# terraform configuration block example
terraform {
    required_version = ">=0.13.0"
    required_providers {
        aws = ">=3.0.0"
    }
}
