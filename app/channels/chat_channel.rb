# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
    tools_all = Tools::Attendance::Event.where("start > ?", Date.yesterday())
    ActionCable.server.broadcast "chat",
       message: tools_all.to_json(:include => [:user ])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
