module "vpc" {
    source = "./modules/vpc"
    keenVpcCidr = var.keenVpcCidr
    pubSnCidr = var.pubSnCidr
    privSnCidr = var.privSnCidr
}

   