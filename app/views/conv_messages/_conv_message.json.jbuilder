json.extract! conv_message, :id, :conversation_id, :user, :message, :created_at, :updated_at
json.url conv_message_url(conv_message, format: :json)
