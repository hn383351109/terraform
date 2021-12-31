#定义环境部署所在region
provider "aws" {
  region = "${var.aws_region}"
}
