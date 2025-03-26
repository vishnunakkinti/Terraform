output "s3_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
  description = "The name of the s3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.id
  description = "The name of the dynamodb table"
}

output "cluster_endpoint" {
  description = "eks cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "eks cluster name"
  value       = module.eks.cluster_name
}

output "vpc_id" {
  description = "vpc ID"
  value       = module.vpc.vpc_id
}