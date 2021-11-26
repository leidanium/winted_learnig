class Attribute < ApplicationRecord
    has_many :article_attributes
    has_many :articles, through: :article_attributes

    enum v_type: [:number, :string]
end
