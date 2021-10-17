# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    @videos = Video.all

    render status: :ok, json: VideoSerializer.new(@videos).serialize
  end

  def create
    category = Category.find_by(id: filtered_params[:category_id])
    @video = Video.create(title: filtered_params[:title], category: category)

    @video.file.attach(filtered_params[:file])
    save_thumbnails

    if @video.file.attached?
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def show
    @video = Video.find(filtered_params[:id])

    render status: :ok, json: @video
  end

  private

  def filtered_params
    params.permit(:file, :title, :category_id, :thumbnail)
  end

  def save_thumbnails
    config = { thumbnail_64x64: '64x64', thumbnail_128x128: '128x128',thumbnail_256x256: '256x256'}
    @video.thumbnail.attach(filtered_params[:thumbnail])

    config.each do |attach_name, size|
      image = MiniMagick::Image.read(@video.thumbnail.download)
      image.resize(size)
      @video.send(attach_name).attach(io:  File.open(image.tempfile), filename: "#{attach_name}.png")
    end
  end

end
