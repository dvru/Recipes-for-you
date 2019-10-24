class UtensilsController < ApplicationController
  
  def index
    @utensils = Utensil.all 
  end

  def show
    @utensil = Utensil.find(params[:id])
  end

  def new
    @utensil = Utensil.new
  end

 
def create 
  @utensil = Utensil.new(utensil_params)

  if @utensil.valid?
      @utensil.save 
      # buybug
      redirect_to utensil_path(@utensil) 
  else 
      flash[:errors] = @utensil.errors.full_messages
      redirect_to new_utensil_path
  end 
end

  def edit
    @utensil = Utensil.find(params[:id])
  end

  def update 
    @utensil = Utensil.find(params[:id])
    @utensil.update(utensil_params)
    redirect_to utensil_path(@utensil)
end

def destroy 
  @utensil = Utensil.find(params[:id])
  @utensil.destroy 
  redirect_to utensils_path
end 

  private

def utensil_params
    params.require(:utensil).permit(:name)
end 

end
