class CatsController < ApplicationController

  before_action :ensure_ownership, only: [:edit, :update] 

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.includes(rental_requests: [:user]).find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end


  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex, :user_id)
  end

  def ensure_ownership
    @cat = Cat.find(params[:id])
    if @cat.user_id == current_user.id
    else
      redirect_to cat_url(@cat)
    end
  end
end
