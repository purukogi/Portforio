class Pbox < ApplicationRecord
  belongs_to :user
  validates :pbox_name,  presence: true, length: { maximum: 50 }
end
