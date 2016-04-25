require 'rails_helper'

RSpec.describe Phrase, type: :model do
  it 'has a valid factory' do
    expect(build(:phrase)).to be_valid
  end

  let(:phrase) { build(:phrase) }

  describe 'ActiveRecord associations' do
    it { expect(phrase).to belong_to(:fraction) }
  end

  describe 'ActiveModel validations' do
    it { expect(phrase).to validate_presence_of(:name) }
    it { expect(phrase).to validate_uniqueness_of(:name) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(phrase).to respond_to(:parsed_description) }
    end
    describe '#parsed_description' do
      context 'when fraction contains description' do
        it 'returns parsed_description' do
          expect(phrase.parsed_description).to eq(phrase.fraction.description)
        end
      end

      context 'when fraction doesnt contain description' do
        before { phrase.fraction.description = nil }

        it 'returns parsed_description' do
          expect(phrase.parsed_description).to eq(I18n.t('description.default_description'))
        end
      end
    end
  end
end
