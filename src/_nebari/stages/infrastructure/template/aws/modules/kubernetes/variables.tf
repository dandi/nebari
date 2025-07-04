variable "name" {
  description = "Prefix name for EKS cluster"
  type        = string
}

variable "tags" {
  description = "Additional tags for EKS cluster"
  type        = map(string)
  default     = {}
}

variable "cluster_subnets" {
  description = "AWS VPC subnets to use for EKS cluster"
  type        = list(string)
}

variable "region" {
  description = "AWS region for EKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "AWS kubernetes version for EKS cluster"
  type        = string
}

variable "cluster_security_groups" {
  description = "AWS security groups to use for EKS cluster"
  type        = list(string)
}

variable "cluster_additional_policies" {
  description = "Additional policies to add to cluster"
  type        = list(string)
  default     = []
}

variable "node_group_additional_policies" {
  description = "Additional policies to add to each node group"
  type        = list(string)
  default     = []
}

variable "node_groups" {
  description = "Node groups to add to EKS Cluster"
  type = list(object({
    name            = string
    instance_type   = string
    spot            = bool
    gpu             = bool
    min_size        = number
    desired_size    = number
    max_size        = number
    single_subnet   = bool
    launch_template = map(any)
    ami_type        = string
    node_taints = list(object({
      key    = string
      value  = string
      effect = string
    }))
  }))
}

variable "node_group_instance_type" {
  description = "AWS instance types to use for kubernetes nodes"
  type        = string
  default     = "m5.large"
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "endpoint_private_access" {
  type    = bool
  default = false
}

variable "eks_kms_arn" {
  description = "kms key arn for EKS cluster encryption_config"
  type        = string
  default     = null
}

variable "public_access_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the role"
  type        = string
  default     = null
}
