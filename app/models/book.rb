class Book < ApplicationRecord
  # Adds: Associations 1(User):N(Book)
  belongs_to :user
end
