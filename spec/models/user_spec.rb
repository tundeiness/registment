require 'rails_helper'

RSpec.describe User, type: :model do
  # let!(:users) { FactoryBot.create_list(:user, 20)
  context 'validations' do
    # subject { build(:user) }
    # let(:user) { build :user }

    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:phone) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:first_name).is_at_least(3) }
  end

  context 'Associations' do
    it { should have_many(:bookings) }
    it { should have_many(:equipment) }
  end

  context 'with a first_name that is under 3 chars' do
    it 'is invalid' do
      user = build(:user, first_name: 'lo')
      expect(user).to be_invalid
      expect(user.errors[:first_name]).to include('is too short (minimum is 3 characters)')
    end
  end

  context 'with a last_name that is under 3 chars' do
    it 'is invalid' do
      user = build(:user, last_name: 'zo')
      user.valid?
      expect(user.errors[:last_name]).to include('is too short (minimum is 3 characters)')
    end
  end

  context 'when phone number is too short' do
    it 'is not valid' do
      user = build(:user, phone: '123')
      user.valid?
      expect(user.errors[:phone]).to include('is too short (minimum is 7 characters)')
    end
  end

  context 'when password is too short' do
    it 'is invalid' do
      user = build(:user, password: 'syw5')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end

  context 'when address is too short' do
    it 'is invalid' do
      user = build(:user, address: '#5 Pool')
      user.valid?
      expect(user.errors[:address]).to include('is too short (minimum is 10 characters)')
    end
  end
end
