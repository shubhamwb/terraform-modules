resource "aws_s3_bucket" "tf_bucket" {
  #bucket = var.s3_bucket_name
  count  = length(var.s3_bucket_list)
  bucket = "${var.s3_bucket_list[count.index]}-${var.s3_env}"
}   