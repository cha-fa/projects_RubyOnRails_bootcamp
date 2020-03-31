class Admin::EventSubmissionsController < Admin::BaseController


def index


end

def show
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  @event.validated = true
  @event.save
  redirect_to admin_event_path(@event.id)
end

def destroy
  @event = Event.find(params[:id])
  @event.validated = false
  @event.save
  redirect_to admin_events_path(@event.id)
end


end