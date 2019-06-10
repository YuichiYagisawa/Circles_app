require "application_system_test_case"

class CirclesTest < ApplicationSystemTestCase
  setup do
    @circle = circles(:one)
  end

  test "visiting the index" do
    visit circles_url
    assert_selector "h1", text: "Circles"
  end

  test "creating a Circle" do
    visit circles_url
    click_on "New Circle"

    fill_in "Circle email", with: @circle.circle_email
    fill_in "Circle info", with: @circle.circle_info
    fill_in "Circle name", with: @circle.circle_name
    click_on "Create Circle"

    assert_text "Circle was successfully created"
    click_on "Back"
  end

  test "updating a Circle" do
    visit circles_url
    click_on "Edit", match: :first

    fill_in "Circle email", with: @circle.circle_email
    fill_in "Circle info", with: @circle.circle_info
    fill_in "Circle name", with: @circle.circle_name
    click_on "Update Circle"

    assert_text "Circle was successfully updated"
    click_on "Back"
  end

  test "destroying a Circle" do
    visit circles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Circle was successfully destroyed"
  end
end
