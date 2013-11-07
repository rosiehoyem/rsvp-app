class EventsController < ApplicationController
  def new
  	@user = User.find(params[:user_id])
  	@event = @user.events.build
  end

  def create
  	@user = User.find(params[:user_id])
    @event = @user.events.build(event_params)
    @event.save
    redirect_to event_path(@event)
  end

  def index
  	@events = Events.all
  end

  def show
  	@event = Event.find(params[:id])
  	@user = @event.user
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :date)
  end

end
