require 'rails_helper'

RSpec.describe Equipment, type: :model do
 
  # describe 'brand_name' do
  #   it 'must have a brand_name' do
  #     equip = build(:equipment, brand_name: '')
  #     expect(equip.brand_name).to be_empty
  #   end

  #   it 'has a brand_name' do
  #     equip = build(:equipment, brand_name: 'Sokkia')
  #     expect(equip.brand_name).to eq('Sokkia')
  #   end
  # end

  # describe 'supplier' do
  #   it 'must have a supplier name' do
  #     equip = build(:equipment, supplier: '')
  #     expect(equip.supplier).to be_empty
  #   end

  #   it 'has a supplier name' do
  #     equip = build(:equipment, supplier: 'Skiddo Nig Ltd')
  #     expect(equip.supplier).to eq('Skiddo Nig Ltd')
  #   end

  #   it 'has a supplier name with at least 3 characters long' do
  #     equip = build(:equipment, supplier: 'Skiddo Nig Ltd')
  #     expect(equip.supplier).to eq('Skiddo Nig Ltd')
  #   end
  # end

  # describe 'serial_no' do
  #   it 'must have a serial number' do
  #     equip = build(:equipment, serial_no: '')
  #     expect(equip.serial_no).to be_empty
  #   end

  #   it 'must have a serial number' do
  #     equip = build(:equipment, serial_no: 'we3435gyx78199023za')
  #     expect(equip.serial_no).to eq('we3435gyx78199023za')
  #   end
  # end

  # describe 'description' do
  #   it 'must have a description' do
  #     equip = build(:equipment, serial_no: '')
  #     expect(equip.serial_no).to be_empty
  #   end

  #   it 'has a description with at least 3 characters long' do
  #     equip = build(:equipment, serial_no: 'we3435gyx78199023za')
  #     expect(equip.serial_no).to eq('we3435gyx78199023za')
  #   end
  # end

  context 'validation tests' do

    describe 'brand name' do
      it 'is not stated' do
        equipment = build(:equipment, brand_name: '', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end

      it 'is stated' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end

      it 'has brand name with at least 3 characters long' do
        equipment = build(:equipment, brand_name: 'Tyr', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end

    describe 'condition' do
      it 'is not stated' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: '', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end

      it 'is stated' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end

      it 'has condition specified with at least 3 characters long' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end


    describe 'model number' do
      it 'cannot be empty' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: '', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end

      it 'has model number' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end

      it 'has model number with at least 3 character long' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end

    describe 'description' do
      it 'cannot be empty' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to_not be_valid
      end

      it 'is not empty' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end

      it 'has a minimum of 10 characters' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end

    describe 'serial number' do
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


    describe 'supplier' do
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

    describe 'acquistion date' do
      it 'cannot be empty' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: 'Ut cillum sit cillum cupidatat ullamco fugiat quis duis fugiat ullamco magna.', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '')
        expect(equipment).to_not be_valid
      end

      it 'is not empty' do
        equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
        expect(equipment).to be_valid
      end
    end


    describe 'All' do
      context 'Equipment Fields' do
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
