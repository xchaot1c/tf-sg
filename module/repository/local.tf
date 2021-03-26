locals {
  sg_rules_cidr = { for rule in var.sg_rules_cidr:
  format("%s_%s_%s-%s", rule[0], rule[1], rule[3], rule[4]) => {
      type = rule[1]
      cidr = split(",", rule[2])
      from_port = rule[3]
      to_port = rule[4]
      protocol =  rule[5]
      description = rule[6]
  }
}
sg_rules_id = { for rule in var.sg_rules_id:
  format("%s_%s_%s-%s", rule[0], rule[1], rule[3], rule[4]) => {
      type = rule[1]
      source_security_group_id = rule[2]
      from_port = rule[3]
      to_port = rule[4]
      protocol =  rule[5]
      description = rule[6]
  }
}


}