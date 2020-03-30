class Ivent < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :place, presence: true
  validates :iventday, presence: true
end
