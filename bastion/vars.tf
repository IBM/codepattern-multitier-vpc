# Generated by buildIT
variable "vpc-name" {
  description = "Define vpc"
}
variable "resource-group" {
  description = "Define resource group"
}
variable "region" {
  description = "Define region"
}
variable "zone1" {
  description = "Define zone1"
}
variable "zone2" {
  description = "Define zone2"
}
variable "bastionserver-name" {
  description = "Define bastion instance name"
}
variable "profile-bastionserver" {
  description = "Define bastion instance profile"
}
variable "image" {
  description = "Define OS image for compute instances"
}
variable "vpc-id" {
  description = "Get vpc id"
}
variable "group-id" {
  description = "Get resource group id"
}
variable "sshkey-id" {
  description = "Get ssh key id"
}
variable "bastion-subnet-zone1-id" {
  description = "Get bastion subnet zone1 id"
}
variable "bastion-subnet-zone2-id" {
  description = "Get bastion subnet zone2 id"
}
variable "bastion-securitygroup-id" {
  description = "Get bastion security group id"
}
variable "maintenance-securitygroup-id" {
  description = "Get maintenance security group id"
}
