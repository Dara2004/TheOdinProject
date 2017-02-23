class User < ApplicationRecord
  has_many :microposts
  validates FILL-IN, presence: true #replace FILL_IN with the right code -> name cant be blank
  validates FILL-IN, presence: true #replace FILL_IN with the right code -> email cant be blank

end
