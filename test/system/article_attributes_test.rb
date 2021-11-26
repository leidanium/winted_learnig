require "application_system_test_case"

class ArticleAttributesTest < ApplicationSystemTestCase
  setup do
    @article_attribute = article_attributes(:one)
  end

  test "visiting the index" do
    visit article_attributes_url
    assert_selector "h1", text: "Article Attributes"
  end

  test "creating a Article attribute" do
    visit article_attributes_url
    click_on "New Article Attribute"

    fill_in "References", with: @article_attribute.references
    fill_in "Value", with: @article_attribute.value
    click_on "Create Article attribute"

    assert_text "Article attribute was successfully created"
    click_on "Back"
  end

  test "updating a Article attribute" do
    visit article_attributes_url
    click_on "Edit", match: :first

    fill_in "References", with: @article_attribute.references
    fill_in "Value", with: @article_attribute.value
    click_on "Update Article attribute"

    assert_text "Article attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Article attribute" do
    visit article_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article attribute was successfully destroyed"
  end
end
