class Article < ApplicationRecord

    has_many :article_categories
    has_many :categories, dependant: :delete_all

    has_many :article_characteristics, dependent: :destroy
    has_many :characteristics, through: :article_characteristics

    has_one :address
    belongs_to :user

    enum condition: ["neuf", "bon etat", "pour piece"]
end
