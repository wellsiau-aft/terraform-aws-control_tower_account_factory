data "tls_certificate" "tfc_certificate" {
  count = local.is_dynamic_provider_credentials ? 1 : 0
  url   = "https://${local.terraform_api_hostname}"
}

resource "aws_iam_openid_connect_provider" "tfc_provider" {
  count           = local.is_dynamic_provider_credentials ? 1 : 0
  provider        = aws.aft_management
  url             = data.tls_certificate.tfc_certificate[count.index].url
  client_id_list  = [var.terraform_oidc_audience]
  thumbprint_list = [data.tls_certificate.tfc_certificate[count.index].certificates[0].sha1_fingerprint]
}