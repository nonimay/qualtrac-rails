require 'rails_helper'

RSpec.describe Member, :type => :model do

  describe 'validation' do
    it { should validate_presence_of :first_name }
  end
end
