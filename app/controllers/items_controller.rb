class ItemsController < ApplicationController


  def create
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

  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Item Completed" }
      format.js {flash.now[:notice] = "Item Completed"}
    end

    # if @items.destroy
    #   flash[:notice] = "Item completed"
    #   redirect_to root_path
    # else
    #   flash[:alert] = "Hmm..Couldnt check that one off...try again"
    #   redirect_to root_path
    # end
  end
end
