module "cvm" {
  source = "./modules/cvm"
  secret_id = var.secret_id
  secret_key = var.secret_key
  password = var.password
  memory = 16
#  vpc_id = module.vpc.vpc_id
#  subnet_id = module.vpc.subnet_id
  instance_name = "k8s"
}
