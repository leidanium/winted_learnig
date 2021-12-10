class Article < ApplicationRecord
    has_and_belongs_to_many :categories, dependant: :delete_all
    has_many :article_characteristics, dependent: :delete_all
    # has_many :characteristics, through: :article_characteristics
    has_one :address
    belongs_to :article

    enum condition: ["neuf", "bon etat", "pour piece"]
end
