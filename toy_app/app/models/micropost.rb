class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, length: {maximum: 140}
  presence: true #making sure the content cant be blank
end
