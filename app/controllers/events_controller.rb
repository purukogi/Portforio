class EventsController < ApplicationController
  
  def event_signup
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'イベントを登録しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'イベント名、開催場所、開催日程は必須入力です'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def event_edit
    @event = Event.find(params[:id])
  end
  
  def event_update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = 'イベントを更新しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'イベント名、開催場所、開催日程は必須入力です'
      redirect_back(fallback_location: root_path)
    end
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
