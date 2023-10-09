data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "mysql_host" {
  value = aws_db_instance.rds.endpoint
}
