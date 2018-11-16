class Tools::Attendance::EventsController < Tools::ToolsController
  before_action :set_tools_attendance_event, only: [:show, :edit, :update, :destroy]

  # GET /tools/attendance/events
  def index
    @tools_attendance_events = Tools::Attendance::Event.all
    render json: @tools_attendance_events
  end

  # GET /tools/attendance/event/date
  def date
    @tools_attendance_events = Tools::Attendance::Event.where( "extract(year from start) = ? AND extract(month from start) = ?", Time.zone.now.strftime("%Y") , Time.zone.now.strftime("%m"))
    
    render json: @tools_attendance_events
  end

  # GET /tools/attendance/event/user
  def user
    @tools_attendance_events = Tools::Attendance::Event.where( :user_id => current_user.id )
    render json: @tools_attendance_events
  end

  # GET /tools/attendance/events/new
  def new
    @tools_attendance_event = Tools::Attendance::Event.new
  end

  # GET /tools/attendance/events/1/edit
  def edit
  end

  # POST /tools/attendance/events
  def create
    @tools_attendance_event = Tools::Attendance::Event.new(tools_attendance_event_params)
    tools_all = Tools::Attendance::Event.where("start > ?", Date.yesterday())
    if @tools_attendance_event[:start] < Date.today()
	redirect_to tools_attendance_url
    else
    	if @tools_attendance_event.save
    	   ActionCable.server.broadcast "chat",
        	   message: tools_all.to_json(:include => [:user])
    	end

    	if @tools_attendance_event["color"] != "red"
       		redirect_to tools_attendance_url
    	end
    end
  end

  # PATCH/PUT /tools/attendance/events/1
  def update
    if @tools_attendance_event.update(tools_attendance_event_params)
      redirect_to @tools_attendance_event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tools/attendance/events/1
  def destroy
    tools_all = Tools::Attendance::Event.where("start > ?", Date.yesterday())
    if @tools_attendance_event["start"] < Date.today()
 	redirect_to tools_attendance_url#, notice: '古いイベントは削除できません!'
    elsif @tools_attendance_event.destroy
       ActionCable.server.broadcast "chat",
           message: tools_all.to_json(:include => [:user ])
    else
        redirect_to tools_attendance_url#, notice: 'Error: エラーが生じました。ページを再読み込みしてください'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tools_attendance_event
      @tools_attendance_event = Tools::Attendance::Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tools_attendance_event_params
      params.require(:tools_attendance_event).permit(:user_id, :title, :start, :color, :allDay)
    end

end
