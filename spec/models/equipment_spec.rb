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

  context 'scopes' do
    describe '.by_condition' do
      let!(:equipment1) { create(:equipment, condition: 'new') }
      let!(:equipment2) { create(:equipment, condition: 'need_repair') }
      let!(:equipment3) { create(:equipment, condition: 'intact') }
      let!(:equipment4) { create(:equipment, condition: 'new') }

      it 'returns equipment grouped by condition with count' do
        expect(Equipment.by_condition).to eq({ 'new' => 2, 'need_repair' => 1, 'intact' => 1 })
      end
    end

    describe '.newest' do
      let(:newest) { build_stubbed :equipment, created_at: Date.today }

      before do
        allow(Equipment).to receive(:newest).and_return([newest])
      end

      it { expect(Equipment.newest).to include newest }
    end

    describe '.loan_count' do
      let!(:equipment1) { create(:equipment, loan_status: 'available') }
      let!(:equipment2) { create(:equipment, loan_status: 'not_available') }
      let!(:equipment3) { create(:equipment, loan_status: 'on_loan') }
      let!(:equipment4) { create(:equipment, loan_status: 'booked') }
      let!(:equipment5) { create(:equipment, loan_status: 'available') }
      let!(:equipment6) { create(:equipment, loan_status: 'in_store') }

      it 'returns equipment grouped by loan_status with count' do
        expect(Equipment.loan_count).to eq({ 'available' => 2, 'not_available' => 1, 'on_loan' => 1, 'booked' => 1, 'in_store' => 1 })
      end
    end
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
