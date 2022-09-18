output "region_short_name_map" {
  description = "The four to five character shortname of any given region."
  value       = local.region_short_name_map
}

output "region_short_name" {
  description = "The four to five character shortname of the region specified in var.region."
  value       = local.region_short_name
}
