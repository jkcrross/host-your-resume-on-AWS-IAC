resource "aws_s3_bucket" "resume" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "resume" {
  bucket = aws_s3_bucket.resume.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "resume" {
  bucket = aws_s3_bucket.resume.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "error_file" {
  bucket = aws_s3_bucket.resume.id
  key    = "error.html"
  source = "../resume/error.html"
  etag = filemd5("../resume/error.html")
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "index_file" {
  bucket = aws_s3_bucket.resume.id
  key    = "index.html"
  source = "../resume/index.html"
  etag = filemd5("../resume/index.html")
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "css_file" {
  bucket = aws_s3_bucket.resume.id
  key    = "resume.css"
  source = "../resume/resume.css"
  etag = filemd5("../resume/resume.css")
  acl = "public-read"
  content_type = "text/html"
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.resume.website_endpoint
}

output "website_domain" {
  value = aws_s3_bucket_website_configuration.resume.website_domain
}