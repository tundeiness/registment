require 'rails_helper'

RSpec.describe Equipment, type: :model do
  describe 'Brand name' do
    context 'when it is not stated' do
      it 'is not valid' do
        equipment = build(:equipment, brand_name: '', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end
    end
    context 'when it is stated' do
      it 'is valid' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end
    context 'character count' do
      it 'is at least 3 characters long' do
        equipment = build(:equipment, brand_name: 'Tyr', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end
  end

  describe 'Condition' do
    context 'when it is not stated' do
      it 'is not valid' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: '', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end
    end

    context 'when it is stated' do
      it 'is valid' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end

    context 'character count' do
      it 'is at least 3 characters long' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end
  end

  describe 'Model number' do
    context 'when it is not stated' do
      it 'is not valid' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: '', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end
    end

    context 'when it is stated' do
      it 'is valid' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end

    context 'character count' do
      it 'is at least 3 character long' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end
  end

  describe 'Description' do
    context 'when it is not stated' do
      it 'is not valid' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end
    end

    context 'when it is stated' do
      it 'is valid' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end

    context 'charcter count' do
      it 'is a minimum of 10 characters' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end
  end

  context 'serial number' do
    it 'cannot be empty' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: 'Ut cillum sit cillum cupidatat ullamco fugiat quis duis fugiat ullamco magna.', serial_no: '', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
      expect(equipment).to_not be_valid
    end

    it 'is not empty' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
      expect(equipment).to be_valid
    end

    it 'has a minimum of 3 characters' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2d4', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
      expect(equipment).to be_valid
    end
  end

  context 'supplier' do
    it 'cannot be empty' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: 'Ut cillum sit cillum cupidatat ullamco fugiat quis duis fugiat ullamco magna.', serial_no: '2344900292x87353', supplier: '', date_acquired: '2022-09-21')
      expect(equipment).to_not be_valid
    end

    it 'is not empty' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
      expect(equipment).to be_valid
    end

    it 'has a minimum of 3 characters' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2d4', supplier: 'Tyr', date_acquired: '2022-09-21')
      expect(equipment).to be_valid
    end
  end

  context 'acquistion date' do
    it 'cannot be empty' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: 'Ut cillum sit cillum cupidatat ullamco fugiat quis duis fugiat ullamco magna.', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '')
      expect(equipment).to_not be_valid
    end

    it 'is not empty' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
      expect(equipment).to be_valid
    end
  end

  context 'Fields' do
    it 'cannot be empty' do
      equipment = build(:equipment, brand_name: '', condition: '', model_number: '', description: '', serial_no: '', supplier: '', date_acquired: '')
      expect(equipment).to_not be_valid
    end

    it 'is not empty' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
      expect(equipment).to be_valid
    end

    it 'has a minimum of 3 characters' do
      equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2d4', supplier: 'Tyro & Sons', date_acquired: '2022-09-21')
      expect(equipment).to be_valid
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
