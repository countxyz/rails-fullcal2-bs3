class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :delete, :destroy]
  respond_to :html, :js, :json

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
  end

  def update
    @event.update_attributes(event_params)
  end

  def destroy 
    @event.destroy
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start, :finish,
        :all_day)
    end
end
