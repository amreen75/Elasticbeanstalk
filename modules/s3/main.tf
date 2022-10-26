# Create a bucket

resource "aws_s3_bucket" "b1" {
  bucket = var.bucketname
  acl    = "public-read"
}

# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b1.id
  key    = var.key
  acl    = "public-read"
  source = "${path.module}/../../code/tested-eb-node-express-sample-master.zip"
  etag = filemd5("${path.module}/../../code/tested-eb-node-express-sample-master.zip")
}