# Declare the data source for getting AZs in region
data "aws_availability_zones" "available" {
  state = "available"
}
