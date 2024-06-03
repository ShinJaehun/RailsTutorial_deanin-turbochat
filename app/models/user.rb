class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  scope :all_except, ->(user) { where.not(id: user) } 
  #users 목록에 자기 제외하고 나머지 user들이 모두 나와야 하니까

  after_create_commit { broadcast_append_to "users" }
  has_many :messages
end
