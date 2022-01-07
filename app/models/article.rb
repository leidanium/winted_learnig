class Article < ApplicationRecord

    has_and_belongs_to_many :categories
    accepts_nested_attributes_for :categories

    # has_many :article_categories

    has_many :article_characteristics, dependent: :destroy
    has_many :characteristics, through: :article_characteristics

    has_one :address
    belongs_to :user

    has_many_attached :images

    enum condition: ["neuf", "bon etat", "pour piece"]
end
