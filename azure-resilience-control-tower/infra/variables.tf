variable "subscription_id" {
  type        = string
  description = "Azure subscription id used by Terraform."
}

variable "project_name" {
  type        = string
  description = "Project name used in Azure resource naming."

  validation {
    condition     = can(regex("^[a-z0-9-]{3,20}$", var.project_name))
    error_message = "project_name must be 3-20 characters using lowercase letters, numbers, and hyphens."
  }
}

variable "environment_name" {
  type        = string
  description = "Deployment environment name."

  validation {
    condition     = can(regex("^[a-z0-9-]{2,12}$", var.environment_name))
    error_message = "environment_name must be 2-12 characters using lowercase letters, numbers, and hyphens."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Existing Azure resource group name where resources will be deployed."

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "container_repository" {
  type        = string
  description = "Container repository name inside ACR."
  default     = "webapp"

  validation {
    condition     = length(trimspace(var.container_repository)) > 0
    error_message = "container_repository must not be empty."
  }
}

variable "container_image_tag" {
  type        = string
  description = "Image tag deployed to App Service."

  validation {
    condition     = length(trimspace(var.container_image_tag)) > 0
    error_message = "container_image_tag must not be empty."
  }
}

variable "key_vault_allowed_ip" {
  type        = string
  description = "Public IPv4 address temporarily allowed to reach the Key Vault data plane during Terraform runs."
  default     = ""

  validation {
    condition = (
      var.key_vault_allowed_ip == "" ||
      can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", var.key_vault_allowed_ip))
    )
    error_message = "key_vault_allowed_ip must be empty or a valid IPv4 address."
  }
}
