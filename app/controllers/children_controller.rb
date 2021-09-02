class ChildrenController < ApplicationController
  before_action :set_children, only: [:show, :edit, :update, :destroy]

  def index
    @children = policy_scope(Child).where(user: current_user)
    @events = Event.where(child: @child)
    @user = current_user
    @all_events = []
    @all_past_events = []

    @children.each do |child|
      child.events.each do |event|
        if event.start_date > Time.now
          @all_events << event
        end
      end
    end

    @children.each do |child|
      child.events.each do |event|
        if event.start_date < Time.now && event.photos.blank?
          @all_past_events << event
        end
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    authorize @child
    if params[:query].present?
      @gifts = Gift.search_gifts(params[:query])
    else
      @gifts = Gift.all
    end
    @activities = Activity.all
    @event_new = Event.new
    @events = Event.where(child: @child)
    if params[:event_id].present?
      @event = Event.find(params[:event_id])
    end
    @years = @child.events.map { |event| event.start_date.year }.uniq.sort.reverse
    map_geocode
    respond_to do |format|
      if params[:query].present?
        format.js { render partial: 'search_result.js.erb' }
      else
        format.html
        format.js
      end
    end
  end

  def new
    @child = Child.new
    authorize @child
  end

  def create
    @child = Child.new(child_params)
    @child.user = current_user
    authorize @child
    if @child.save
      redirect_to children_path
    else
      render :new
    end
  end

  def edit
    authorize @child
  end

  def update
    @child.update(child_params)
    authorize @child
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
    params.require(:child).permit(:first_name, :middle_name, :last_name, :birthday, :hobby, :parent, :photo, :gender)
  end

  def map_geocode
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "map_components/info_window", locals: { activity: activity }),
        id: activity.id
      }
    end
  end
end
