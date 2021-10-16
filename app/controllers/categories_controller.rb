class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    render status: :ok, json: @categories
  end
end
