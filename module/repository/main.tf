resource "aws_security_group" "sg" {
  name                   = var.name
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete
}

resource "aws_security_group_rule" "sg_rules_cidr" {
    for_each = local.sg_rules_cidr
    security_group_id = aws_security_group.sg.id
    type              =  lookup(each.value, "type")

    description = lookup(each.value, "description")
    cidr_blocks = lookup(each.value, "cidr")
    from_port   = lookup(each.value, "from_port")
    to_port     = lookup(each.value, "to_port")
    protocol    = lookup(each.value, "protocol")
 }

 resource "aws_security_group_rule" "sg_rules_id" {
    for_each = local.sg_rules_id
    security_group_id = aws_security_group.sg.id
    type              =  lookup(each.value, "type")

    description = lookup(each.value, "description")
    source_security_group_id = lookup(each.value, "source_security_group_id")
    from_port   = lookup(each.value, "from_port")
    to_port     = lookup(each.value, "to_port")
    protocol    = lookup(each.value, "protocol")
 }
