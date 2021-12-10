require "application_system_test_case"

class SoldsTest < ApplicationSystemTestCase
  setup do
    @sold = solds(:one)
  end

  test "visiting the index" do
    visit solds_url
    assert_selector "h1", text: "Solds"
  end

  test "creating a Sold" do
    visit solds_url
    click_on "New Sold"

    fill_in "Article", with: @sold.article_id
    check "Closed" if @sold.closed
    fill_in "Price", with: @sold.price
    fill_in "User", with: @sold.user_id
    click_on "Create Sold"

    assert_text "Sold was successfully created"
    click_on "Back"
  end

  test "updating a Sold" do
    visit solds_url
    click_on "Edit", match: :first

    fill_in "Article", with: @sold.article_id
    check "Closed" if @sold.closed
    fill_in "Price", with: @sold.price
    fill_in "User", with: @sold.user_id
    click_on "Update Sold"

    assert_text "Sold was successfully updated"
    click_on "Back"
  end

  test "destroying a Sold" do
    visit solds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sold was successfully destroyed"
  end
end
