variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "name" {
  description = "Name of security group"
  type        = string
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}


variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. Enable for EMR."
  type        = bool
  default     = false
}

variable "sg_rules_cidr" {
  description = "List of ingress rules to create by name"
  type        = list(list(string))
  default     = [[]]
}

variable "sg_rules_id" {
  description = "List of ingress rules to create by name"
  type        = list(list(string))
  default     = [[]]
}