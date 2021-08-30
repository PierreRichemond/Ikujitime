class ActivitiesController < ApplicationController

  def show
    @activity = Activity.find(params[:id])
    @events = Event.all.where(child_id: params[:child_id])
    authorize @activity
  end
end
