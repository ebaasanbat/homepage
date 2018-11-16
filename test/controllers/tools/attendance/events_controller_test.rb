require 'test_helper'

class Tools::Attendance::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tools_attendance_event = tools_attendance_events(:one)
  end

  test "should get index" do
    get tools_attendance_events_url
    assert_response :success
  end

  test "should get new" do
    get new_tools_attendance_event_url
    assert_response :success
  end

  test "should create tools_attendance_event" do
    assert_difference('Tools::Attendance::Event.count') do
      post tools_attendance_events_url, params: { tools_attendance_event: { allDay: @tools_attendance_event.allDay, color: @tools_attendance_event.color, start: @tools_attendance_event.start, title: @tools_attendance_event.title } }
    end

    assert_redirected_to tools_attendance_event_url(Tools::Attendance::Event.last)
  end

  test "should show tools_attendance_event" do
    get tools_attendance_event_url(@tools_attendance_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_tools_attendance_event_url(@tools_attendance_event)
    assert_response :success
  end

  test "should update tools_attendance_event" do
    patch tools_attendance_event_url(@tools_attendance_event), params: { tools_attendance_event: { allDay: @tools_attendance_event.allDay, color: @tools_attendance_event.color, start: @tools_attendance_event.start, title: @tools_attendance_event.title } }
    assert_redirected_to tools_attendance_event_url(@tools_attendance_event)
  end

  test "should destroy tools_attendance_event" do
    assert_difference('Tools::Attendance::Event.count', -1) do
      delete tools_attendance_event_url(@tools_attendance_event)
    end

    assert_redirected_to tools_attendance_events_url
  end
end
