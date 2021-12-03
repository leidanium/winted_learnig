class Characteristic < ApplicationRecord
    has_many :article_characteristics
    has_many :articles, through: :article_characteristics

    enum v_type: [:number, :string]
end
