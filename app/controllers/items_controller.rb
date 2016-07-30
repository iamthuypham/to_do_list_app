class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    
    if @item.save
      flash[:notice] = "Item was saved successfully."
      redirect_to @item
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :new
    end
  end
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def destroy
    @item = Item.find(params[:id])
 
    if @item.destroy
      flash.now[:alert] = "\"#{@item.name}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the item."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  def item_params
     params.require(:item).permit(:name)
  end
end
