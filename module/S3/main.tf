# Create an S3 Bucket
resource "aws_s3_bucket" "imentorlly_se_dev_01" {
  bucket = "imentorlly_se_dev_01"  # Make sure this bucket name is unique

  versioning {
    enabled = true
  }

  tags = {
    Name        = "imentorlly_se_dev_01"
    Environment = "Dev"
  }
}

# Create an S3 Bucket Policy
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.imentorlly_se_dev_01.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.imentorlly_se_dev_01.id}/*",
            "Principal": "*"
        }
    ]
}
POLICY
}
