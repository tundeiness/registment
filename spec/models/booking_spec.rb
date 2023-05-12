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


  context 'method' do
    describe '#update_usage_count' do
      let(:equipment) { create(:equipment) }
      let(:booking) { create(:booking, equipment: equipment) }

      it 'should update the usage count when the status is changed to loaned out' do
        expect {
          booking.update(status: 'loaned_out')
        }.to change { equipment.usage_count }.by(1)
      end

      it 'should not update the usage count when the status is not changed to loaned out' do
        expect {
          booking.update(status: 'Available')
        }.not_to change { equipment.usage_count }
      end
    end
  end
end
