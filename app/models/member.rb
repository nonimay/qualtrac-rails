class Member < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :membership_number, numericality: { only_integer: true, greater_than: 0 }
end
