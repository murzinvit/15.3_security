resource "yandex_kms_symmetric_key" "key-a" {
  name              = "example-symetric-key"
  description       = "description for key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}

resource "yandex_storage_bucket" "netologybucket" {
  access_key    = var.bucket_access_key
  secret_key    = var.bucket_secret_key
  acl           = "public-read"
  bucket        = "netologybucket"
  force_destroy = "true"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  website {
    index_document = "index.html"
  }
}

resource "yandex_storage_object" "image-object" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  acl        = "public-read"
  bucket     = "netologybucket"
  key        = "coffee.jpg"
  source     = "./files/coffee.jpg"
  depends_on = [
    yandex_storage_bucket.netologybucket,
  ]
}


