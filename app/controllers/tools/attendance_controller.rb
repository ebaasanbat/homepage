class Tools::AttendanceController < Tools::ToolsController

  def index
    gon.admin = current_user.admin
    gon.user_id = current_user.id
    if(Time.now.wday>=3 && Time.now.wday<=5)
        date = Date.today
        date += (1 + ((4-date.wday) % 7))%7
    else
        date = Date.today
        date += (1 + ((1-date.wday) % 7))%7
    end
    gon.date = date
    @nextworkday = date
    @users = User
    @tools_attendance_event = Tools::Attendance::Event.new
  end
end
