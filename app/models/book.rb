class Book < ApplicationRecord
  has_many :lending_histories, dependent: :destroy
  validates :title, presence: true
  validates :title, presence: true
end
