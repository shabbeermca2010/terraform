terraform {
  backend "s3" {
    # create a s3 bucket in Aws Console and call the name here
        bucket = "thisisforterraformstatefile"
        key = "ntierdeploydev"
        region = "us-west-2"
        # create a dynamoDB table in Aws Console and call the name here
        dynamodb_table = "thisisforteraformstatefile"

  }
}