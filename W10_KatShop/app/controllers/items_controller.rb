class ItemsController < ApplicationController

  def index
    @items = Item.all
    @user = current_user
    if user_signed_in?
      @cart = @user.cart
    end
  end


  def new
  end

  def show
    @item = Item.find(params[:id])
    @user = current_user
    if user_signed_in?

      @cart = @user.cart

    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(title: params[:title], description: params[:description], price_in_cents: params[:price_in_cents], image_url: params[:image_url])
        flash[:success] = "Le produit a été modifié"
        redirect_to @item
      else
        flash[:alert] = "Le produit n'a pas été modifié"
        render :edit
      end
  end

  def destroy
  end

end

