require 'rails_helper'

RSpec.describe EquipmentCondition, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'equipment condition' do
    subject { build(:equipment_condition) }

    context 'validation' do
      it { should validate_presence_of(:num) }
      it { should validate_presence_of(:condition) }
    end

    context 'model associations' do
      it { should belong_to(:equipment) }
    end
  end


  describe 'after_commit :update_condition_count' do

    let(:equipment) { create(:equipment, condition: 'new') }
    let(:old_condition) { 'new' }
    let(:new_condition) { 'Need Repair' }

    it 'updates the count of new_condition in equipment_conditions table' do
      equipment = create(:equipment, condition: old_condition)
      # expect {
      #   equipment.update(condition: new_condition)
      # }.to change { equipment.equipment_conditions.find_by(condition: new_condition)&.count }.from(nil).to(1)

      expect { equipment.update(condition: new_condition) }.to change { equipment.equipment_conditions.find_by(condition: new_condition)&.count }.from(nil).to(1)
      record = equipment.equipment_conditions.find_by(condition: new_condition)
      expect(record).not_to be_nil
      expect(record.count).to eq(1)

      puts "Record ID: #{record.id.inspect}"
    end

    # it 'updates the count of new_condition in equipment_conditions table' do
      # Create a new record in equipment_conditions table if one doesn't exist
      # EquipmentCondition.find_or_create_by(condition: new_condition)

      # Update equipment condition
      # equipment.update(condition: new_condition)

      # Verify that count has been updated
      # expect(equipment.equipment_conditions.find_by(condition: new_condition).count).to eq(1)
      # expect(equipment.equipment_conditions.find_by(condition: new_condition)&.count).to eq(1)
      # record = equipment.equipment_conditions.find_by(condition: new_condition)
      # puts "Record ID: #{record.id.inspect}"
      # expect(record).not_to be_nil
      # expect(record.count).to eq(1)
    # end
    # let!(:equipment) { create(:equipment, condition: 'new') }

    # let(:old_condition) { 'new' }
    # let(:new_condition) { 'Need Repair' }

    # context 'when condition is changed' do
    #   before do
    #     # Update equipment condition from old_condition to new_condition
    #     equipment.condition = new_condition
    #     equipment.save!
    #   end

    #   it 'updates the count of new_condition in equipment_conditions table' do
    #     expect(equipment.equipment_conditions.find_by(condition: old_condition).count).to eq(0)
    #     expect(equipment.equipment_conditions.find_by(condition: new_condition).count).to eq(1)
    #   end
    # end

    # context 'when equipment condition is updated' do
    #   let(:old_condition) { 'new' }
    #   let(:new_condition) { 'Need Repair' }

    #   before do
    #     equipment.update(condition: new_condition)
    #   end

    #   it 'should update the corresponding EquipmentCondition record' do
    #     expect(EquipmentCondition.find_by(condition: 'new').count).to eq(0)
    #     expect(EquipmentCondition.find_by(condition: 'Need Repair').count).to eq(1)
    #   end
    # end

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
