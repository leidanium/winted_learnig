json.extract! conversation, :id, :article_id, :c_seller_id, :c_buyer_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
