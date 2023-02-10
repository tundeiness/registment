require 'rails_helper'

RSpec.describe Equipment, type: :model do
  describe 'validations' do
    # it 'requires brand name' do
    #   equipment = Equipment.new(brand_name: '')
    #   expect(equipment.valid?).to be_falsy
    # end
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

    # it 'requires condition' do
    #   equipment = Equipment.new(condition: '')
    #   expect(equipment.valid?).to be_falsy
    # end

    # it 'requires model number' do
    #   equipment = Equipment.new(model_number: '')
    #   expect(equipment.valid?).to be_falsy
    # end

    # it 'requires description' do
    #   equipment = Equipment.new(description: '')
    #   expect(equipment.valid?).to be_falsy
    # end

    # it 'requires serial number' do
    #   equipment = Equipment.new(serial_no: '')
    #   expect(equipment.valid?).to be_falsy
    # end

    # it 'requires supplier name' do
    #   equipment = Equipment.new(supplier: '')
    #   expect(equipment.valid?).to be_falsy
    # end

    # it 'requires date of acquisition' do
    #   equipment = Equipment.new(date_acquired: '')
    #   expect(equipment.valid?).to be_falsy
    # end

    # it { should validate_presence_of(:request) }
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
