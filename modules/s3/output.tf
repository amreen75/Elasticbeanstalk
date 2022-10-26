output bucket {
	description = "name of the bucket"
	value = aws_s3_bucket.b1.id
}

output key {
	description = "name the object uploaded as follows"
	value = aws_s3_bucket_object.object.id
}