require 'rails_helper'

RSpec.describe Equipment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'must have a brand_name' do
    equip = FactoryBot.build(:equipment, brand_name: '')
    expect(equip.brand_name).to be_empty
  end
end
