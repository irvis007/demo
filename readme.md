# created pub subnet
# created igw
# internet gateway attached to public subnet
# route table to igw
# route table attached to pub subnet
#
# created priv subnet
# created nat gateway in pub su
# nat gateway attached to priv subnet
# route table to ngw
# route table attached to priv subnet
#
#add SGs
#
# created instance in priv
# created instance in public
#
# create nacl
#https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html#nacl-rules-scenario-2

# parametrize ami
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

#go for modules

#create multi env
#https://www.capitalone.com/tech/software-engineering/deploying-multiple-environments-with-terraform/
