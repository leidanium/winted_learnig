require "test_helper"

class ConvMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conv_message = conv_messages(:one)
  end

  test "should get index" do
    get conv_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_conv_message_url
    assert_response :success
  end

  test "should create conv_message" do
    assert_difference('ConvMessage.count') do
      post conv_messages_url, params: { conv_message: { conversation_id: @conv_message.conversation_id, message: @conv_message.message, user: @conv_message.user } }
    end

    assert_redirected_to conv_message_url(ConvMessage.last)
  end

  test "should show conv_message" do
    get conv_message_url(@conv_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_conv_message_url(@conv_message)
    assert_response :success
  end

  test "should update conv_message" do
    patch conv_message_url(@conv_message), params: { conv_message: { conversation_id: @conv_message.conversation_id, message: @conv_message.message, user: @conv_message.user } }
    assert_redirected_to conv_message_url(@conv_message)
  end

  test "should destroy conv_message" do
    assert_difference('ConvMessage.count', -1) do
      delete conv_message_url(@conv_message)
    end

    assert_redirected_to conv_messages_url
  end
end
