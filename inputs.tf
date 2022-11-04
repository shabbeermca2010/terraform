variable "aws-region" {
    type = string
    description = "my aws region"
  
}
variable "vpc-cidr" {
    type = string
    description = " vpc range"
  }

  variable "vpc-name" {
    type = string
    description = "vpc name" 
  }
  variable "private-subnets" {
    type = list(string)
    
  }
  variable "public-subnets" {
    type = list(string)
    
  }
  variable "ami-id" {
    type = string
    
  }
  variable "web-trigger" {
    type = string
    description = "running number for trigger"
    default = "1.0"

}