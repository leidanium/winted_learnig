class Article < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many :article_attributes
    # has_many :attributes, through: :article_attributes
    has_one :address

    enum condition: ["neuf", "bon etat", "pour piece"]
end
