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
        thumbnail: url(record.thumbnail),
        thumbnail_64x64: url(record.thumbnail_64x64),
        thumbnail_128x128: url(record.thumbnail_128x128),
        thumbnail_256x256: url(record.thumbnail_256x256),
        url: url(record.file),
        category: record.category.name
      }
    end
  end

  def url(file)
    return unless file.attached?

    url_for(file)
  end
end
