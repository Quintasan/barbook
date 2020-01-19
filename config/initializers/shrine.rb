# frozen_string_literal: true

require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.logger = Rails.logger
Shrine.plugin :instrumentation, notifications: ActiveSupport::Notifications
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :derivatives
