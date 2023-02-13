require 'rails_helper'

RSpec.describe Booking, type: :model do
  context 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:booking_date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:pickup_date) }
    it { should validate_presence_of(:return_date) }
    it { should validate_presence_of(:booking_price) }
  end

  context 'Model Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:equipment) }
    it { should_not have_many(:user) }
    it { should_not have_many(:equipment) }
    it { should_not belong_to(:invalid_association) }
    it { should_not have_many(:invalid_association) }
  end
end
