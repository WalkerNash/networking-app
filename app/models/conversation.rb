class Conversation < ApplicationRecord
  belongs_to :relationship, optional: true
  has_many :messages
end
