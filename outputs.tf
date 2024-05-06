output "Public-ip" {
  value       = aws_instance.first.public_ip
  description = "Public IP of the first instance"
  sensitive   = true
}

output "Instance_ID" {
  value = aws_instance.first.id

}

output "volume-size" {
  value = aws_instance.first.root_block_device.0.volume_id

}

output "bucket-region" {
  value = data.aws_s3_bucket.data_bucket.region

}
