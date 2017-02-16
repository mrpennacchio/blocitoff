class ItemsController < ApplicationController

  def create
    # @items = User.find(params[:id])
    @items = current_user.items.build(params[:name])
    @items.name = params[:items][:name]

    if @items.save
      flash[:notice] = "Item saved to To-Do list"
      redirect_to root_path
    else
      flash[:alert] = "Hmmm...something when wrong, try again"
      redirect_to root_path
    end

  end
end
