# frozen_string_literal: true

class Video < ApplicationRecord
  belongs_to :category
  has_one_attached :file

  has_one_attached :thumbnail
  has_one_attached :thumbnail_64x64
  has_one_attached :thumbnail_128x128
  has_one_attached :thumbnail_256x256

  validates :file, attached: true,
                   size: { less_than: 200.megabytes, message: 'File to big' },
                   content_type: { in: %w[video/mp4 video/mov], message: 'Not the correct format' }

end
