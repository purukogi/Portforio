class Refrigerator < ApplicationRecord
  belongs_to :user
  validates :name,  presence: true, length: { maximum: 50 }
  validates :expiration_date,  presence: true
end
