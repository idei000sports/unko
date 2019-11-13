require 'test_helper'

class EventPerformersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_performer = event_performers(:one)
  end

  test "should get index" do
    get event_performers_url
    assert_response :success
  end

  test "should get new" do
    get new_event_performer_url
    assert_response :success
  end

  test "should create event_performer" do
    assert_difference('EventPerformer.count') do
      post event_performers_url, params: { event_performer: { event_id: @event_performer.event_id, performer_name: @event_performer.performer_name } }
    end

    assert_redirected_to event_performer_url(EventPerformer.last)
  end

  test "should show event_performer" do
    get event_performer_url(@event_performer)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_performer_url(@event_performer)
    assert_response :success
  end

  test "should update event_performer" do
    patch event_performer_url(@event_performer), params: { event_performer: { event_id: @event_performer.event_id, performer_name: @event_performer.performer_name } }
    assert_redirected_to event_performer_url(@event_performer)
  end

  test "should destroy event_performer" do
    assert_difference('EventPerformer.count', -1) do
      delete event_performer_url(@event_performer)
    end

    assert_redirected_to event_performers_url
  end
end
