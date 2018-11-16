class CreateToolsAttendanceEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :tools_attendance_events do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.datetime :start
      t.string :color
      t.boolean :allDay

      t.timestamps
    end
  end
end
