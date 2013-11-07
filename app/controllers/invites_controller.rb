class InvitesController < ApplicationController
  def new
  	@event = Event.find(params[:event_id])
  	@invite = @event.invites.build
  end

  def create
  	@event = Event.find(params[:event_id])
  	@invite = @event.invites.build(invite_params)
  	@invite.save
  	redirect_to event_path(@event)
  end

  def edit
  	@event = Event.find(params[:event_id])
  	@invite = Invite.find(params[:invite_id])
  end

  def update
  	@event = Event.find(params[:event_id])
  	@invite = @event.invites.find(params[:id])
  	@invite.rsvp = params[:rsvp]
  	@invite.save
  	redirect_to event_invites_path(@event)
  end  

  def index
  	@event = Event.find(params[:event_id])
  	@invites = @event.invites
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def invite_params
    params.require(:invite).permit(:event_id, :user_id, :rsvp)
  end
end
