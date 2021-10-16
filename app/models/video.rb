# frozen_string_literal: true

class Video < ApplicationRecord
  belongs_to :category
  has_one_attached :file

  has_one_attached :thumbnail do |attachable|
    attachable.variant :thumb_small, resize: '64x64'
    attachable.variant :thumb_medium, resize: '128x128'
    attachable.variant :thumb_big, resize: '256x256'
  end
end
