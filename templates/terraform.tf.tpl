terraform {
  required_version = ">= ${terraform_version}"

  backend "s3" {
    region         = "${region}"
    bucket         = "${bucket}"
    key            = "${terraform_state_file}"
    %{~ if dynamodb_table != "" ~}
    dynamodb_table = "${dynamodb_table}"
    %{~ endif ~}
    %{~ if shared_credentials_file != "" ~}
    shared_credentials_file = "${shared_credentials_file}"
    %{~ endif ~}
    profile        = "${profile}"
    role_arn       = "${role_arn}"
    encrypt        = "${encrypt}"
  }
}
