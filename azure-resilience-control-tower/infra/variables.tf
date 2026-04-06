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

variable "location" {
  type    = string
  default = "westeurope"
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
