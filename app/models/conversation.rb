class Conversation < ApplicationRecord
  belongs_to :article
  belongs_to :user
  belongs_to :user
end
