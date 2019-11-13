require "application_system_test_case"

class EventPerformersTest < ApplicationSystemTestCase
  setup do
    @event_performer = event_performers(:one)
  end

  test "visiting the index" do
    visit event_performers_url
    assert_selector "h1", text: "Event Performers"
  end

  test "creating a Event performer" do
    visit event_performers_url
    click_on "New Event Performer"

    fill_in "Event", with: @event_performer.event_id
    fill_in "Performer name", with: @event_performer.performer_name
    click_on "Create Event performer"

    assert_text "Event performer was successfully created"
    click_on "Back"
  end

  test "updating a Event performer" do
    visit event_performers_url
    click_on "Edit", match: :first

    fill_in "Event", with: @event_performer.event_id
    fill_in "Performer name", with: @event_performer.performer_name
    click_on "Update Event performer"

    assert_text "Event performer was successfully updated"
    click_on "Back"
  end

  test "destroying a Event performer" do
    visit event_performers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event performer was successfully destroyed"
  end
end
