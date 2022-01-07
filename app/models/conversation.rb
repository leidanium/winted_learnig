class Conversation < ApplicationRecord
  belongs_to :article
  
  belongs_to :c_seller, class_name: 'User'
  belongs_to :c_buyer, class_name: 'User'
end
