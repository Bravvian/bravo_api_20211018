# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    @videos = Video.all

    render status: :ok, json: VideoSerializer.new(@videos).serialize
  end

  def create
    @video = Video.create(title: filtered_params[:title], category: Category.first)

    @video.file.attach(filtered_params[:file])

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
    params.permit(:file, :title)
  end
end
