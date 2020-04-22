class EventsController < ApplicationController
  
  def event_signup
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'イベントを追加しました。'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def event_edit
  end
  
  def event_update
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "イベントを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private # strongparameterの設定

    def event_params
      params.require(:event).permit(:eventname, :eventdetail, :place, :eventday)
    end
end
