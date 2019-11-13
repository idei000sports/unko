require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { end_date: @event.end_date, event_adv: @event.event_adv, event_description: @event.event_description, event_door: @event.event_door, event_id: @event.event_id, event_title: @event.event_title, event_venue: @event.event_venue, start_date: @event.start_date, user_id: @event.user_id } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { end_date: @event.end_date, event_adv: @event.event_adv, event_description: @event.event_description, event_door: @event.event_door, event_id: @event.event_id, event_title: @event.event_title, event_venue: @event.event_venue, start_date: @event.start_date, user_id: @event.user_id } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
