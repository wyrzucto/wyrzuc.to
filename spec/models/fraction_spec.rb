require 'rails_helper'

RSpec.describe Fraction, type: :model do
  it 'has a valid factory' do
    expect(build(:fraction)).to be_valid
  end

  let(:fraction) { build(:fraction) }

  describe 'ActiveRecord associations' do
    it { expect(fraction).to have_many(:phrases) }
  end
end
