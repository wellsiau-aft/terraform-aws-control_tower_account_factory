{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:${data_aws_partition_current_partition}:iam::${aft_account_id}:root"
      },
      "Action": "sts:AssumeRole"
    }
    %{ if terraform_dynamic_provider_credentials == "true" },
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:${data_aws_partition_current_partition}:iam::${aft_account_id}:oidc-provider/app.terraform.io"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "app.terraform.io:aud": "${terraform_oidc_audience}"
        },
        "StringLike": {
          "app.terraform.io:sub": "${terraform_oidc_subject}"
        }
      }
    }
    %{ endif }
  ]
}
