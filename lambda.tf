locals {
  lambda_zip_location="output/lambda_archive.zip"
}
data "archive_file" "init" {
  type        = "zip"
  source_file = "example.py"
  output_path = "$(local.lambda_zip_location)"
}
resource "aws_lambda_function" "test_lambda" {
  filename      = "$(local.lambda_zip_location)"
  function_name = "lambda_handler"
  role          = aws_iam_role.example_role_lambda.arn
  handler       = "example.lambda_handler"
  runtime       = "python3.8"

  #source_code_hash = "$(file-base64sha256(local.lambda_zip_location))"
}