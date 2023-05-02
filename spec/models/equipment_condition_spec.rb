require 'rails_helper'

RSpec.describe EquipmentCondition, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'equipment condition' do
    subject { build(:equipment_condition) }

    context 'validation' do
      it { should validate_presence_of(:count) }
      it { should validate_presence_of(:condition) }
    end

    context 'model associations' do
      it { should belong_to(:equipment) }
    end
  end
  

  describe 'after_commit :update_condition_count' do
    let(:equipment) { create(:equipment, condition: "new") }

    context 'when equipment condition is updated' do
      before do
        equipment.update(condition: 'Need Repair')
      end

      it "should update the corresponding EquipmentCondition record" do
        expect(EquipmentCondition.find_by(condition: "New").count).to eq(0)
        expect(EquipmentCondition.find_by(condition: "Need Repair").count).to eq(1)
      end
    end

    # context "when equipment condition is not updated" do
    #   before do
    #     equipment.update(name: "Test Equipment")
    #   end

    #   it "should not update any EquipmentConditionCount record" do
    #     expect(EquipmentConditionCount.find_by(condition: "New").count).to eq(0)
    #     expect(EquipmentConditionCount.find_by(condition: "Need Repair").count).to eq(0)
    #   end
    # end
  end
end
