require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'has a valid factory' do
    expect(build(:employee)).to be_valid
  end

  let(:employee) { build(:employee) }

  describe 'ActiveModel validations' do
    it { expect(employee).to validate_presence_of(:first_name) }
    it { expect(employee).to validate_presence_of(:last_name) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(employee).to respond_to(:full_name) }
    end
    describe '#full_name' do
      it 'returns full name' do
        expect(employee.full_name).to eq("#{employee.first_name} #{employee.last_name}")
      end
    end
  end
end
