require 'rails_helper'

RSpec.describe EquipmentCondition, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validations' do
    subject { build(:equipment_condition) }

    it { should validate_presence_of(:count) }
    it { should validate_presence_of(:condition) }
  end

  context 'model associations' do
    it { should belong_to(:equipment) }
  end
end
