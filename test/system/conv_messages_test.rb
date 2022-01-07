require "application_system_test_case"

class ConvMessagesTest < ApplicationSystemTestCase
  setup do
    @conv_message = conv_messages(:one)
  end

  test "visiting the index" do
    visit conv_messages_url
    assert_selector "h1", text: "Conv Messages"
  end

  test "creating a Conv message" do
    visit conv_messages_url
    click_on "New Conv Message"

    fill_in "Conversation", with: @conv_message.conversation_id
    fill_in "Message", with: @conv_message.message
    fill_in "User", with: @conv_message.user
    click_on "Create Conv message"

    assert_text "Conv message was successfully created"
    click_on "Back"
  end

  test "updating a Conv message" do
    visit conv_messages_url
    click_on "Edit", match: :first

    fill_in "Conversation", with: @conv_message.conversation_id
    fill_in "Message", with: @conv_message.message
    fill_in "User", with: @conv_message.user
    click_on "Update Conv message"

    assert_text "Conv message was successfully updated"
    click_on "Back"
  end

  test "destroying a Conv message" do
    visit conv_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conv message was successfully destroyed"
  end
end
