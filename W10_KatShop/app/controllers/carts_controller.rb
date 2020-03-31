class CartsController < ApplicationController
before_action :authenticate_user!
before_action :my_cart

  def show
    @items_list = JoinItemCart.where(cart: current_user.cart)
    @user = current_user
    @cart = current_user.cart
  end

  def destroy
    @items_list = JoinItemCart.where(cart: current_user.cart)
    @items_list.destroy_all

    redirect_to user_cart_path(@current_user.id)
  end


private

def my_cart
  @cart = Cart.find(params[:id])

  unless current_user== @cart.user
    flash[:danger] ="Vous n'êtes pas autorisé à consulter cette page"
      redirect_to root_path
    
  end

  end

end
 