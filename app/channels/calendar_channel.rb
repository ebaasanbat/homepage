class CalendarChannel < ApplicationCable::Channel

  def subscribed
    stream_from "calendar_channel"
  end

  def unsubscribed
    # lol
  end

  def send_message(data)
    # save data
  end
end
