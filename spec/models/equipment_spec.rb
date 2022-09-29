require 'rails_helper'

RSpec.describe Equipment, type: :model do
  describe 'validations' do
    # it 'requires brand name' do
    #   equipment = Equipment.new(brand_name: '')
    #   expect(equipment.valid?).to be_falsy
    # end

    it { should validate_presence_of(:brand_name) }
    it { should validate_presence_of(:condition) }
    it { should validate_presence_of(:model_number) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:serial_no) }
    it { should validate_presence_of(:supplier) }
    it { should validate_presence_of(:date_acquired) }

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

  # it 'belongs to request' do
  #   equipment = Equipment.new(brand_name: '', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21', request: nil)
  #   expect(equipment.valid?).to be_falsy
  # end

  # it 'has belong_to request association' do
  #   request = build(:request)
  #   equipment = build(:equipment, request)
  #   expect(equipment.request).to eq(request)

  #   e = Equipment.reflect_on_association(:request)
  #   expect(e.macro).to eq(:belongs_to)
  # end

  # it { should belong_to(:request) }

  # it { should validate_uniqueness_of(:brand_name).scoped_to(:request_id).with_message('no two person can book the same equipment') }

  # describe 'Brand name' do
  #   context 'when it is not stated' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: '', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to_not be_valid
  #     end
  #   end
  #   context 'when it is stated' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  #   context 'character count' do
  #     it 'is at least 3 characters long' do
  #       equipment = build(:equipment, brand_name: 'Tyr', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  # describe 'Condition' do
  #   context 'when it is not stated' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: '', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to_not be_valid
  #     end
  #   end

  #   context 'when it is stated' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end

  #   context 'character count' do
  #     it 'is at least 3 characters long' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  # describe 'Model number' do
  #   context 'when it is not stated' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: '', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to_not be_valid
  #     end
  #   end

  #   context 'when it is stated' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end

  #   context 'character count' do
  #     it 'is at least 3 character long' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  # describe 'Description' do
  #   context 'when it is not stated' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to_not be_valid
  #     end
  #   end

  #   context 'when it is stated' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end

  #   context 'charcter count' do
  #     it 'is a minimum of 10 characters' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  # describe 'Serial number' do
  #   context 'when it is not stated' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: 'Ut cillum sit cillum cupidatat ullamco fugiat quis duis fugiat ullamco magna.', serial_no: '', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to_not be_valid
  #     end
  #   end

  #   context 'when it is stated' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end

  #   context 'character count of at least 3 characters long' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2d4', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  # describe 'Supplier' do
  #   context 'when it is not stated' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: 'Ut cillum sit cillum cupidatat ullamco fugiat quis duis fugiat ullamco magna.', serial_no: '2344900292x87353', supplier: '', date_acquired: '2022-09-21')
  #       expect(equipment).to_not be_valid
  #     end
  #   end

  #   context 'when it is stated' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end

  #   context 'character count of at least 3 characters long' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2d4', supplier: 'Tyr', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  # describe 'Acquistion date' do
  #   context 'when it is not stated' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: 'Ut cillum sit cillum cupidatat ullamco fugiat quis duis fugiat ullamco magna.', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '')
  #       expect(equipment).to_not be_valid
  #     end
  #   end

  #   context 'when it is stated' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  # describe 'Fields' do
  #   context 'when they are not filled' do
  #     it 'is not valid' do
  #       equipment = build(:equipment, brand_name: '', condition: '', model_number: '', description: '', serial_no: '', supplier: '', date_acquired: '')
  #       expect(equipment).to_not be_valid
  #     end
  #   end

  #   context 'when they are all filled' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3435gyx7023za', description: '3rd order Total station', serial_no: '2344900292x87353', supplier: 'Strafford & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end

  #   context 'with character count of at least 3 characters long' do
  #     it 'is valid' do
  #       equipment = build(:equipment, brand_name: 'Sokkia', condition: 'broken', model_number: 'we3', description: '3rd order Total station', serial_no: '2d4', supplier: 'Tyro & Sons', date_acquired: '2022-09-21')
  #       expect(equipment).to be_valid
  #     end
  #   end
  # end

  context 'Association tests' do
    describe 'model associations' do
      # it 'has many request' do
      #   has_many_assc = Equipment.reflect_on_association(:request)
      #   expect(has_many_assc.macro).to eq :has_many
      # end
    end
  end
end
