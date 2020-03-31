class AttendancesController < ApplicationController
layout 'application'
before_action :authenticate_user!, only: [:new, :create]
before_action :my_event, only: [:index]

  def new
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
  end

  def index
    @event = Event.find(params[:event_id])
    @attendances = Attendance.where(event: @event)
  end

  def create
    @event = Event.find(params[:event_id])
    # Amount in cents
    @amount = @event.price * 100
    @attendance_check = Attendance.find_by(event_id: @event.id, user_id: current_user.id)



    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Paiement évènement',
      currency: 'eur',
    })

@attendance = Attendance.create(event_id: @event.id, user_id: current_user.id, stripe_customer_id: customer.id)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_event_attendance(@event.id)


end

private

  def my_event
    @event = Event.find(params[:event_id])
    unless current_user.id == @event.administrator_id
      flash[:danger] = "Vous n'êtes pas autorisé à modifier cet évènement"
      redirect_to @event
      
    end
  end



end