json.extract! article, :id, :name, :price, :desc, :sold, :condition, :created_at, :updated_at
json.url article_url(article, format: :json)
