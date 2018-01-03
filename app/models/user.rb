class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Paperclip Shit
  has_attached_file :avatar, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :posts, dependent: :destroy

  # User/Relationship Association Logic
  has_many :sent_invites, class_name: "Relationship", foreign_key: :inviting_id
  has_many :received_invites, class_name: "Relationship", foreign_key: :invited_id
  has_many :invited_users, through: :sent_invites, source: :invited_user
  has_many :inviting_users, through: :received_invites, source: :inviting_user
  has_many :conversations, through: :relationships
  has_many :messages, through: :conversations

  #Data objects for User Registration/Edit dropdown menus
  LOCATIONS = ['Philadelphia', 'New York', 'Washington D.C', 'Boston', 'Chicago', 'Austin', 'Dallas', 'San Francisco', 'Los Angeles', 'San Diego', 'Seattle', 'Portland', 'Denver']
  PROFESSIONS = ['Tech', 'Hospitality', 'Science', 'Engineering', 'Medical', 'Event Organization']
  AGES = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
     31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
      41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
    51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
  61, 62, 63, 64, 65, 66, 67, 68, 69, 70 ]

end
