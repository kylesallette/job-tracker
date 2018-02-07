class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new()
  end

  def show
    @category = Category.find(params[:id])
   @job = Job.where(category_id: @category.id)
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added to Categories!"
    redirect_to category_path(@category)
   else
    redirect_to categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "Category #{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  private

  def category_params
   params.require(:category).permit(:title)
  end




end
