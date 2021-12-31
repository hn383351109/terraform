##- AWS上简单架构设计POC -##
1. 创建一个VPC
2. 在VPC创建两个public子网,两个private子网
3. 创建IGW,将两个public子网关联到IGW上
4. 创建NAT,将两个private子网关联到NAT上,NAT网关关联一个public子网
5. 创建public路由表,关联public子网,添加默认路由到IGW
6. 创建private路由表,关联private子网,添加默认路由到NAT
7. 创建两个EIP,一个关联到NAT网关,另一个关联一个public子网下instance
8. 创建SG安全组,开放相关端口,在instance实例上挂载
9. 创建public instance实例挂载sg/eip/ssh_key等配置
