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
- [x] create multiple environments
- [ ] enforce default tagging, in conjunction with env type
- [ ] combine default with custom tags
- [ ] change code to be able to spawn multiple priv and public subnets automatically, consider connected resources(SGs, Routes, nacls)
- [ ] adjust code to spawn given number of instances in each subnet
- [ ] tbc

## Materials:

### network
- [Recommended network ACL rules for a VPC with public and private subnets (NAT)](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html#nacl-rules-scenario-2)
- [Terraform generate subnet CIDR using network function](https://tech.david-cheong.com/terraform-generate-subnet-cidr-using-network-function/)

- []()

### instances
- [Data Source: aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)

### terraform hacks, tips and good to knows
- [hashicorp modules](https://www.terraform.io/docs/language/modules/develop/structure.html)
- [What Are Terraform Modules and How Do They Work?](https://www.freecodecamp.org/news/terraform-modules-explained/)
- [Deploying Multiple Environments with Terraform](https://www.capitalone.com/tech/software-engineering/deploying-multiple-environments-with-terraform/)
- [Use Modules from the Registry](https://learn.hashicorp.com/tutorials/terraform/module-use?in=terraform/modules)
- [ Standard Module Structure ](https://www.terraform.io/docs/language/modules/develop/structure.html)
- [Tagging with Terraform](https://blog.davidjeddy.com/2019/06/25/tagging-with-terraform/)
- [How to create reusable infrastructure with Terraform modules](https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d)
- [Terraform tips & tricks: loops, if-statements, and gotchas](https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9#0223)
