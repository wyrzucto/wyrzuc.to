require 'rails_helper'

RSpec.describe District, type: :model do
  it 'has a valid factory' do
    expect(build(:district)).to be_valid
  end

  let(:district) { build(:district) }

  describe 'ActiveModel validations' do
    it { expect(district).to validate_presence_of(:name) }
    it { expect(district).to validate_uniqueness_of(:name) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(district).to respond_to(:to_s) }
    end
    describe '#to_s' do
      it 'returns name' do
        expect(district.to_s).to eq(district.name)
      end
    end
  end
end
