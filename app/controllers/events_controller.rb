class EventsController < ApplicationController
  
  def event_signup
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'イベントを追加しました。'
      redirect_to events_url
    else
      redirect_to events_url
    end
  end
  
  def event_edit
  end
  
  def event_update
  end
  
  private # strongparameterの設定

    def event_params
      params.require(:event).permit(:eventname, :place, :eventday)
    end
end
