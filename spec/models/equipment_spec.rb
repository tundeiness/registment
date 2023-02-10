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

  context 'Association tests' do
    describe 'model associations' do
      it { should have_many(:bookings) }
      it { should have_many(:users) }
      it { should_not belong_to(:invalid_association) }
    end
  end
end
