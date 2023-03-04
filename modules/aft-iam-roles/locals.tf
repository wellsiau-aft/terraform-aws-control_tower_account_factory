# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

locals {
  aft_admin_assumed_role_arn      = "arn:${data.aws_partition.current.partition}:sts::${data.aws_caller_identity.aft_management.account_id}:assumed-role/AWSAFTAdmin/AWSAFT-Session"
  is_dynamic_provider_credentials = lower(var.terraform_dynamic_provider_credentials) == "true" ? true : false
}
