############################################
############################################
############################################
## SOURCING MODULES
############################################
############################################
############################################

############################################
############################################
# this is an example of a module having
# it's source code located in a local 
# directory; it's version is defined so
# updates don't break the module. in this
# case, the "region" of the resources would
# be defined in the separate 
# "variables.tfvars" file
############################################
############################################

############################################
module "my-vpc-module-1" {
    source = "~/Documents/Development/terraform/custom_modules"
    version = "0.0.5"    
    region = var.region
}
############################################

############################################
############################################
############################################
## INPUT AND OUTPUT OF MODULES
############################################
############################################
############################################

############################################
############################################
# this is an example of a module that has a 
# user-defined value of "us-east-1" for the
# variable "server-name"; # this represents 
# a value which can be reused whenever the 
# module is called in the master project code
############################################
############################################

#############################################
module "my-vpc-module" {
  source = "./modules/vpc"
  server-name = "us-east-1"
}
#############################################

############################################
############################################
# this user-defined value can be called by 
# another resource within the module; the
# server-name can get its value using
#  "var.server-name"; taking it as an input
############################################
############################################

############################################
module "my-vpc-module" {
  source = "./modules/vpc"
  server-name = "us-east-1"

  resource "aws_instance" "my-vpc-module" {
  server-name = var.server-name
  }
}
############################################

############################################
############################################
# the module can take that same input 
# defined by the user, and "output" it for 
# use by other parts of the  code outside
# the module. In this case, an AWS EC2
# instance from the root module is using 
# "server-name" from the "my-vpc-module"
# module as an output
############################################
############################################


############################################

module "my-vpc-module" {
  source = "./modules/vpc"
  version = "0.0.5"

    variable "server_type" {
      type = string
      default = "t2.micro"
    }
    resource "aws_instance" "web-a" {
      ami = 123456.ami
      instance_type = "var.server_type"
    }
    output "server-tag" {
      value = aws_instance.web-a.instance_type
    }
  }
resource "aws_instance" "web-b" {
  ami = 123456.ami
  instance_type = module.my-vpc-module.server-tag
  }
############################################