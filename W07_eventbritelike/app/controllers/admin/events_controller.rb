class Admin::EventsController < Admin::BaseController


  def index
  end

  def show
    @event = Event.find(params[:id])
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
      redirect_to admin_event_path(@event.id)
      flash.alert = "L'évènement a été modifié !"
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path
    flash.alert = "L'évènement n°#{params[:id]} a bien été supprimé !"
  end

end