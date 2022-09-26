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
end
