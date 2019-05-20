class Lease < ApplicationRecord
  has_and_belongs_to_many :users

  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :due_date, presence: true
end
