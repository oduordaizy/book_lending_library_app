class Book < ApplicationRecord
  has_many :lending_histories, dependent: :destroy
  validates :title, presence: true
  validates :title, presence: true

  def available? # Checks if book is available
    lending_histories.where(returned_at: nil).empty?
  end
end
