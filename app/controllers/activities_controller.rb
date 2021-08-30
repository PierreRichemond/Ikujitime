class ActivitiesController < ApplicationController

  def show
    @activity = Activity.find(params[:id])
    @events = Event.all.where(child_id: params[:child_id]).where( 'start_date > ?', Time.now )
    authorize @activity
  end
end
