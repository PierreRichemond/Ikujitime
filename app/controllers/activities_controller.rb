class ActivitiesController < ApplicationController

  def show
    @child = Child.find(params[:child_id])
    @activity = Activity.find(params[:id])
    @events = Event.all.where(child_id: params[:child_id]).where( 'start_date > ?', Time.now )
    authorize @activity
  end
end
