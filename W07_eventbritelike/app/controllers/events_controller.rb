class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :my_event, only: [:edit, :update, :destroy]
  before_action :validated, only: [:show]
  layout 'application'
  
  def index

  end

  def show
    @event = Event.find(params['id'])
    @attendance = Attendance.where(event: @event)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      title: params[:title],
      start_date: params[:start_date],
      duration: params[:duration],
      location: params[:location],
      price: params[:price],
      description: params[:description],
      administrator_id: current_user.id
      )
    @event.event_picture.attach(params[:event_picture])
    if @event.save
      redirect_to @event
      flash.alert = "L'évènement a été créé !"
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.update(
      title: params[:title],
      start_date: params[:start_date],
      duration: params[:duration],
      location: params[:location],
      price: params[:price],
      description: params[:description],
      )
    if @event.save
      redirect_to @event
      flash.alert = "L'évènement a été modifié !"
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
    flash.alert = "L'évènement n°#{params[:id]} a bien été supprimé !"
  end

  private

  def my_event
    @event = Event.find(params[:id])
    unless current_user.id == @event.administrator_id
      flash[:danger] = "Vous n'êtes pas autorisé à modifier cet évènement"
      redirect_to @event
      
    end
  end

  def validated
    @event = Event.find(params[:id])
    unless @event.validated == true
      flash[:danger] = "Cet évènement n'est pas validé"
      redirect_to root_path
    end
  end

end
