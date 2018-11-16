class Tools::Attendance::EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :color, :allDay
  belongs_to :user
end
