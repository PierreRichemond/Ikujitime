class ChildrenController < ApplicationController
  before_action :set_children, only: [:show, :edit, :update, :destroy]

  def index
    @children = policy_scope(Child)
  end

  def show
    @gifts = Gift.all
    @activities = Activity.all
    @events = Event.all
    authorize @child
    map_geocode
  end

  def new
    @child.new
  end

  def create
    @child.new(child_params)

    if @child.save
      redirect_to child_path(@child)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @child.update(child_params)
    if @child.valid?
      redirect_to child_path(@child)
    else
      render :edit
    end
  end

  def destroy
    @child.destroy
    authorize @child
    redirect_to children_path
  end

  private

  def set_children
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :middle_name, :last_name, :birthday, :hobby, :parent)
  end

  def map_geocode
    @markers = @activities.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
