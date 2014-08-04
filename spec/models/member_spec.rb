require 'rails_helper'

RSpec.describe Member, :type => :model do

  describe 'validation' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_numericality_of(:membership_number).only_integer }
    it { should validate_numericality_of(:membership_number).is_greater_than(0) }
    it { should validate_uniqueness_of(:membership_number) }
  end
end
