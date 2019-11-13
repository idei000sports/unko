require "application_system_test_case"

class EvenpsTest < ApplicationSystemTestCase
  setup do
    @evenp = evenps(:one)
  end

  test "visiting the index" do
    visit evenps_url
    assert_selector "h1", text: "Evenps"
  end

  test "creating a Evenp" do
    visit evenps_url
    click_on "New Evenp"

    fill_in "Description", with: @evenp.description
    fill_in "End date", with: @evenp.end_date
    fill_in "Start date", with: @evenp.start_date
    fill_in "Title", with: @evenp.title
    click_on "Create Evenp"

    assert_text "Evenp was successfully created"
    click_on "Back"
  end

  test "updating a Evenp" do
    visit evenps_url
    click_on "Edit", match: :first

    fill_in "Description", with: @evenp.description
    fill_in "End date", with: @evenp.end_date
    fill_in "Start date", with: @evenp.start_date
    fill_in "Title", with: @evenp.title
    click_on "Update Evenp"

    assert_text "Evenp was successfully updated"
    click_on "Back"
  end

  test "destroying a Evenp" do
    visit evenps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evenp was successfully destroyed"
  end
end
