# frozen_string_literal: true

require 'json'

class VideoSerializer
  include Rails.application.routes.url_helpers

  def initialize(collection)
    @collection = collection
  end

  def serialize
    @collection.map do |record|
      {
        id: record.id,
        title: record.title,
        synopsis: record.synopsis,
        thumbnail: record.thumbnail,
        url: url(record),
        category: record.category.name
      }
    end
  end

  def url_2(record)
    # ActiveStorage::Blob.service.send(:path_for, attachment.blob.key)
    # Rails.application.routes.url_helpers.rails_blob_path(record.file, only_path: true)
    record.file.attached? ? ActiveStorage::Blob.service.send(:path_for, record.file.attachment.blob.key) : nil
  end

  def url(record)
    return unless record.file.attached?

    record.file.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: url_for(record.file))
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end
end
