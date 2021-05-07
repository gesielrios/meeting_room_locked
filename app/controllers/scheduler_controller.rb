class SchedulerController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @week = Week.for_date(Time.now)
    @lockeds = Lock.where(:week_id => @week.id)
  end


  # GET /toggle_register
  def toggle_register
    @lock = Lock.where(:user => current_user.id, 
      :week => Week.for_date(Time.now),
      :time_start => params[:time_start],
      :day_index => params[:day_index]).first

    respond_to do |format|
      format.json do
        if @lock
          status = _unregister_reservation
          if status
            render :json => {'unregister' => 'ok', 'email' => current_user.email}
          else
            render :json => {'unregister' => 'fail', 'email' => current_user.email}
          end
        else
          status = _register_reservation
          if status
            render :json => {'register' => 'ok', 'email' => current_user.email}
          else
            render :json => {'register' => 'fail', 'email' => current_user.email}
          end
        end
      end
    end
  end

  private

  def _unregister_reservation
    @lock = Lock.where(:user => current_user.id, 
      :week => Week.for_date(Time.now),
      :time_start => params[:time_start],
      :day_index => params[:day_index]).first

    if @lock
      @lock.destroy
    else
      nil
    end
  end

  def _register_reservation
    @lock = Lock.new(
      :user => current_user, :week => Week.for_date(Time.now),
      :time_start => params[:time_start], :time_end => params[:time_start].to_i + 1,
      :day_index => params[:day_index])

    if @lock.save
      @lock
    else
      nil
    end
  end

end
