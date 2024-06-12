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
        add_notification(@category.errors.full_messages, "error")
    end
  end

  def edit
    @category = Category.friendly.find(params[:slug])
  end

  def update
    @category = Category.friendly.find(params[:slug])
    if @category.update(category_params)
      @categories = Category.all
      render :index
    else
      add_notification(@category.errors.full_messages, "error")
    end
  end

  def destroy
    @category = Category.friendly.find(params[:slug])
    if @category.products.any?
      add_notification("Impossible de supprimer la catégorie car elle contient des produits", "error")
    else
      @category.destroy
      @categories = Category.all
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:label)
  end
end