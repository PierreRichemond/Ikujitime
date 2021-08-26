class EventsController < ApplicationController
    before_action :find_event, only: [:edit, :update, :destroy]

  def create
    policy_scope_event
  end

  def update
    @event = Event.new(event_params)
    @gift = Gift.find(params[:gift_id])
    @activity = Activity.find(params[:activity_id])
    @event.gift = @gift
    @event.activity = @activity
    policy_scope_event
    if @event.save
      redirect_to child_path(@event.child)
    end
  end

  def destroy
  end

  private

  def set_children
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_date, :end_date, :occasion, :gift_id, :child_id, :photos)
  end

  def policy_scope_event
    authorize @event
  end
end
