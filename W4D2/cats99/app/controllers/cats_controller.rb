class CatsController < ApplicationController
  def index
    @cats = Cat.all
    # render json: "Yo"
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    # debugger

    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end 

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def create
    @cat = Cat.create!(cat_params)
    # render json: params

    if @cat.save!
      redirect_to cat_url(@cat)
    else
      redirect_to :new
    end
  end


  private 
  
  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :birth_date, :description)
  end 
end
