class EventsController < ApplicationController
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

  private

    def event_params
      params.require(:event).permit(:name, :description, :start, :finish)
    end
end
