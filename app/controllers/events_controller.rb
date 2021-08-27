class EventsController < ApplicationController
    before_action :set_event, only: [:edit, :update, :destroy]

  def create
    # policy_scope_event

    @event = Event.new(event_params)
    @child = Child.find(params[:child_id])
    @event.child = @child
    authorize @event
    if @event.save
      redirect_to child_path(@event.child)
    end

  end

  def update
    policy_scope_event
    if @event.update(event_params)
      if params[:gift_id]
        @gift = Gift.find(params[:gift_id])
        @event.gift = @gift
      end
      if params[:activity_id]
        @activity = Activity.find(params[:activity_id])
        @event.activity = @activity
        @event.update(event_params)
      end
    redirect_to child_path(@event.child)
  end
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_date, :end_date, :occasion, :gift_id, :activity_id, :child_id, photos: [])
  end

  def policy_scope_event
    authorize @event
  end
end
