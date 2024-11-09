variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    vpc_id      = string
    ingress     = list(object({
      from_port               = number
      to_port                 = number
      protocol                = string
      cidr_blocks             = list(string)
      
    }))
    tags = map(string)
  }))
  default = {
    sg1 = {
      name        = "1.External_lb_sg"
      description = "Security group for test purposes"
      vpc_id      = " "  
      ingress = [
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          
        },
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          
        }
      ]
      tags = {
        Name = "1.External_lb_sg"
      }
    }
    sg2 = {
      name        = "2.webtier"  
      description = "This security group allows only frontend traffic"
      vpc_id      = " "  
      ingress = [
        {
          from_port               = 80
          to_port                 = 80
          protocol                = "tcp"
          cidr_blocks             = ["0.0.0.0/0"]
          
        }
      ]
      tags = {
        Name = "2.web_tier"
      }
    }

    sg3 = {
      name = "application_sg"
      description = "allow on application port number"
      vpc_id = " "
      ingress = [{
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 4000
        protocol = "tcp"
        
        to_port = 4000
      }]
      tags = {
        Name = "application_sg"
      }

    }

    sg4 = {
      name = "db_sg"
      description = "allow on db application"
      vpc_id = " "
      ingress = [{
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 3366
        protocol = "value"
        
        to_port = 3366
      }]
      tags = {
        Name = "db_sg"
      }
    }
   
  }
}

resource "aws_security_group" "this" {
  for_each = var.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = each.value.vpc_id

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      
      

     
    }
  }

  tags = each.value.tags
}

resource "aws_security_group_rule" "allow_sg1_to_sg2" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.this["sg2"].id
  source_security_group_id  = aws_security_group.this["sg1"].id

  
}



//resource "aws_security_group_rule" "allow_sg1_to_sg2" {
//  type                     = "ingress"
//  from_port                = 22
//  to_port                  = 22
//  protocol                 = "tcp"
//  security_group_id        = aws_security_group.this["sg3"].id
//  source_security_group_id  = aws_security_group.this["sg2"].id
//}
//
//resource "aws_security_group_rule" "allow_sg1_to_sg2" {
//  type                     = "ingress"
//  from_port                = 22
//  to_port                  = 22
//  protocol                 = "tcp"
//  security_group_id        = aws_security_group.this["sg4"].id
//  source_security_group_id  = aws_security_group.this["sg3"].id
//}
