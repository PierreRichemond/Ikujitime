class GiftsController < ApplicationController

  def show
    @gift = Gift.find(params[:id])
    @events = Event.all.where(child_id: params[:child_id])
    authorize @gift
  end
end
