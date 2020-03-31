class JoinItemCartsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @user = current_user
    @quantity = params[:quantity]
      @quantity.to_i.times do
        @join = JoinItemCart.create(
          cart: current_user.cart,
          item: @item)
      end
    if @join.save
      flash[:success] = "Au panier !"
      redirect_to root_path
    else
      flash[:error] = "Une erreur est survenue."
      redirect_to root_path
    end
  end

  def destroy
    @user = current_user
    @cart = current_user.cart
    @object = JoinItemCart.find(params[:id])
    

    @object.destroy

    flash[:success] = "Produit supprimé du panier !"
    redirect_to user_cart_path(@user.id, @cart.id)

  end
  
end
