class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Adds: Associations 1(User):N(Book)
  has_many :books, dependent: :destroy

  # Adds: 
  attachment :profile_image
end
