require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/memory"


# s3_options = Shrine::Storage::S3.new(
# bucket: Rails.application.credentials[:s3][:bucket],
# region: Rails.application.credentials[:s3][:region],
# access_key_id: Rails.application.credentials[:s3][:access_key_id],
# secret_access_key: Rails.application.credentials[:s3][:secret_access_key]
# )
#

s3_options = Rails.application.credentials.s3

Shrine.storages = {
  # cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  # store: Shrine::Storage::S3.new(**s3_options),
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary 
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays 
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file 
Shrine.plugin :validation
Shrine.plugin :validation_helpers


