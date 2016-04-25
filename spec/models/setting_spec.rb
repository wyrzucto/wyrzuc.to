require 'rails_helper'

RSpec.describe Setting, type: :model do
  it 'has a valid factory' do
    expect(build(:setting)).to be_valid
  end

  let(:setting) { build(:setting) }

  describe 'ActiveModel validations' do
    it { expect(setting).to validate_presence_of(:name) }
    it { expect(setting).to validate_uniqueness_of(:name) }
    it { expect(setting).to validate_presence_of(:value) }
  end
end
