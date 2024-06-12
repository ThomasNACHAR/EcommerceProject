class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      @categories = Category.all
      render :index
    else
        add_notification(@category.errors.full_messages, "success")
    end
  end

  private

  def category_params
    params.require(:category).permit(:label)
  end
end