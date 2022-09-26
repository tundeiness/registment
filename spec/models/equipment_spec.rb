require 'rails_helper'

RSpec.describe Equipment, type: :model do
 
  describe 'brand_name' do
    it 'must have a brand_name' do
      equip = build(:equipment, brand_name: '')
      expect(equip.brand_name).to be_empty
    end

    it 'must have a brand_name' do
      equip = build(:equipment, brand_name: 'Sokkia')
      expect(equip.brand_name).to eq('Sokkia')
    end
  end

  describe 'supplier' do
    it 'must have a supplier name' do
      equip = build(:equipment, supplier: '')
      expect(equip.supplier).to be_empty
    end

    it 'must have a supplier name' do
      equip = build(:equipment, supplier: 'Skiddo Nig Ltd')
      expect(equip.supplier).to eq('Skiddo Nig Ltd')
    end
  end

  describe 'serial_no' do
    it 'must have a serial number' do
      equip = build(:equipment, serial_no: '')
      expect(equip.serial_no).to be_empty
    end

    it 'must have a serial number' do
      equip = build(:equipment, serial_no: 'we3435gyx78199023za')
      expect(equip.serial_no).to eq('we3435gyx78199023za')
    end
  end

  context 'validation tests' do
    let(:equipment) { build(:equipment) }

    it 'must have brand name specified' do
      equipment.brand_name = ''
      equipment.condition = 'broken'
      equipment.model_number = 'we3435gyx7023za'
      equipment.description = '3rd order Total station'
      equipment.serial_no = '2344900292x87353'
      equipment.supplier = 'Strafford & Sons'
      equipment.date_acquired = '2022-09-21'
      expect(equipment.save).to eq(false)
    end

    it 'must have condition specified' do
      equipment.brand_name = 'Sokkia'
      equipment.condition = ''
      equipment.model_number = 'we3435gyx7023za'
      equipment.description = '3rd order Total station'
      equipment.serial_no = '2344900292x87353'
      equipment.supplier = 'Strafford & Sons'
      equipment.date_acquired = '2022-09-21'
      expect(equipment.save).to eq(false)
    end

    it 'must have model number specified' do
      equipment.brand_name = 'Sokkia'
      equipment.condition = 'broken'
      equipment.model_number = ''
      equipment.description = '3rd order Total station'
      equipment.serial_no = '2344900292x87353'
      equipment.supplier = 'Strafford & Sons'
      equipment.date_acquired = '2022-09-21'
      expect(equipment.save).to eq(false)
    end

    it 'must have description' do
      equipment.brand_name = 'Sokkia'
      equipment.condition = 'broken'
      equipment.model_number = 'we3435gyx7023za'
      equipment.description = ''
      equipment.serial_no = '2344900292x87353'
      equipment.supplier = 'Strafford & Sons'
      equipment.date_acquired = '2022-09-21'
      expect(equipment.save).to eq(false)
    end

    it 'must have a serial number' do
      equipment.brand_name = 'Sokkia'
      equipment.condition = 'broken'
      equipment.model_number = 'we3435gyx7023za'
      equipment.description = '3rd order Total station'
      equipment.serial_no = ''
      equipment.supplier = 'Strafford & Sons'
      equipment.date_acquired = '2022-09-21'
      expect(equipment.save).to eq(false)
    end

    it 'must have a supplier' do
      equipment.brand_name = 'Sokkia'
      equipment.condition = 'intact'
      equipment.model_number = 'we3435gyx7023za'
      equipment.description = '3rd order Total station'
      equipment.serial_no = '2344900292x87353'
      equipment.supplier = ''
      equipment.date_acquired = '2022-09-21'
      expect(equipment.save).to eq(false)
    end

    it 'must have acquistion date' do
      equipment.brand_name = 'Sokkia'
      equipment.condition = 'intact'
      equipment.model_number = 'we3435gyx7023za'
      equipment.description = '3rd order Total station'
      equipment.serial_no = '2344900292x87353'
      equipment.supplier = 'Strafford & Sons'
      equipment.date_acquired = ''
      expect(equipment.save).to eq(false)
    end

    it 'must not be empty' do
      equipment.brand_name = ''
      equipment.condition = ''
      equipment.model_number = ''
      equipment.description = ''
      equipment.serial_no = ''
      equipment.supplier = ''
      equipment.date_acquired = ''
      expect(equipment.save).to eq(false)
    end
  end

  context 'Association tests' do
    describe 'model associations' do
      # it 'has many request' do 
      #   has_many_assc = Equipment.reflect_on_association(:request)
      #   expect(has_many_assc.macro).to eq :has_many
      # end
    end
  end
end
