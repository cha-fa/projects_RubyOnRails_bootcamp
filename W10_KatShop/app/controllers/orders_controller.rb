class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :my_order, only: [:show]

  def new
    @order = Order.new
    @amount = params[:total_price].to_i
    @items_list = JoinItemCart.where(cart: current_user.cart)
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.where(user: current_user)
  end

  def create

    @user = current_user
    @cart = @user.cart
    @amount = params[:amount]

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Paiement photo',
      currency: 'eur',
    })

    @order = Order.create(user_id: @user.id, stripe_customer_id: customer.id, total_price: @amount)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end


private

def my_order
  @order = Order.find(params[:id])
  unless current_user == @order.user
    flash[:danger] ="Vous n'êtes pas autorisé à consulter cette page"
      redirect_to root_path
  end
end



end


