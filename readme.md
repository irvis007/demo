## To do
- [x] created pub subnet
- [x] created igw
- [x] internet gateway attached to public subnet
- [x] route table to igw
- [x] route table attached to pub subnet
- [x] created priv subnet
- [x] created nat gateway in pub su
- [x] nat gateway attached to priv subnet
- [x] route table to ngw
- [x] route table attached to priv subnet
- [x] add SGs
- [x] created instance in priv
- [x] created instance in public
- [x] create nacl
- [x] go for modules
- [ ] create multiple environments

## Materials:
- [Recommended network ACL rules for a VPC with public and private subnets (NAT)](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html#nacl-rules-scenario-2)
- [Data Source: aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)
- [hashicorp modules](https://www.terraform.io/docs/language/modules/develop/structure.html)
- [What Are Terraform Modules and How Do They Work?](https://www.freecodecamp.org/news/terraform-modules-explained/)
- [Deploying Multiple Environments with Terraform](https://www.capitalone.com/tech/software-engineering/deploying-multiple-environments-with-terraform/)
- [Use Modules from the Registry](https://learn.hashicorp.com/tutorials/terraform/module-use?in=terraform/modules)
