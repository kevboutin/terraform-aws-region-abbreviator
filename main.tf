locals {
  regions = concat(var.additional_regions, [
    "af-south-1",
    "ap-east-1",
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-northeast-3",
    "ap-south-1",
    "ap-south-2",
    "ap-southeast-1",
    "ap-southeast-2",
    "ap-southeast-3",
    "ap-southeast-4",
    "ca-central-1",
    "eu-central-1",
    "eu-central-2",
    "eu-north-1",
    "eu-south-1",
    "eu-south-2",
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "me-central-1",
    "me-south-1",
    "sa-east-1",
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2",
  ])

  parts = var.region == null ? [] : split("-", var.region)

  region_short_name = var.region == null ? "" : join("", [
    local.parts[0],
    replace(local.parts[1], "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/", "$1$2$3$4$5"),
    local.parts[2]
  ])

  # Same computation but kick back a map
  region_short_name_map = { for full_region in local.regions : full_region =>
    join(
      "", [
        split("-", full_region)[0],
        replace(
          split(
          "-", full_region)[1],
          "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/",
          "$1$2$3$4$5"
        ),
        split("-", full_region)[2],
      ]
    )
  }
}
