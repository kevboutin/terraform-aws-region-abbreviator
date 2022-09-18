variable "additional_regions" {
  description = "A user-supplied list of regions to extend the lookup map."
  type        = list(string)
  default     = []
}

variable "region" {
  description = "The AWS region to retrieve a short name for (ex. `us-east-2`)."
  type        = string
  default     = null
}
