class Conversation < ApplicationRecord
  belongs_to :relationship, optional: true
  has_many :messages
  accepts_nested_attributes_for :messages
end
