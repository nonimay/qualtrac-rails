class Member < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :membership_number, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true

  def name
    [last_name, first_name].join ", "
  end
end
