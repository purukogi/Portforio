class Event < ApplicationRecord
  validates :eventname, presence: true
  validates :place, presence: true
  validates :eventday, presence: true
end
