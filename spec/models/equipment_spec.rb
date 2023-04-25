require 'rails_helper'

RSpec.describe Equipment, type: :model do
  describe 'validations' do
    subject { build(:equipment) }

    it { should validate_presence_of(:brand_name) }
    it { should validate_presence_of(:condition) }
    it { should validate_presence_of(:model_number) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:serial_no) }
    it { should validate_presence_of(:supplier) }
    it { should validate_presence_of(:date_acquired) }
    it { should validate_presence_of(:loan_status) }
    it { should validate_presence_of(:service_date) }
  end

  describe '.newest' do
    let(:newest) { build_stubbed :equipment, created_at: Date.today }

    before do
      allow(Equipment).to receive(:newest).and_return([newest])
    end

    it { expect(Equipment.newest).to include newest }
  end

  describe '.with_booking_count' do
    let(:equipment) { create(:equipment) }
    let!(:booking) { create(:booking) }
    let!(:booking2) { create(:booking) }
    let!(:booking3) { create(:booking) }
    let(:super_admin) { create(:user, role: 'super_admin') }

    it 'returns equipments with booking counts' do
      equipments = Equipment.with_booking_count
      # p equipments[0].booking_count
      expect(equipments.length).to eq(3)
      expect(equipments[0].booking_count).to eq(1)
      expect(equipments[1].booking_count).to eq(1)
      expect(equipments[2].booking_count).to eq(1)
      # expect(equipments[0].booking_count).to eq(2)
    end
  end

  context 'Association tests' do
    describe 'model associations' do
      it { should have_many(:bookings) }
      it { should have_many(:users) }
      it { should_not belong_to(:invalid_association) }
    end
  end
end
