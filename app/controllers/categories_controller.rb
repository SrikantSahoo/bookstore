class CategoriesController < ApplicationController
  def new
    @page_title = 'Add Category'

    @category = Category.new

  end

  def create
    @category = Category.new(category_param)
    if @category.save
      flash[:notice] = "Category Created"
      redirect_to categories_path
    else
      render 'new'
    end

  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_param)
    flash[:notice] = 'Category Updated'
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category Removed'
    redirect_to categories_path
  end
  private
    def category_param
    params.require(:category).permit(:name)
  end
end
