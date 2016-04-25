require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'has a valid factory' do
    expect(build(:admin)).to be_valid
  end

  let(:admin) { build(:admin) }

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(admin).to respond_to(:full_name) }
    end
    describe '#full_name' do
      context 'when name and surname exist' do
        it 'returns full name' do
          expect(admin.full_name).to eq("#{admin.name} #{admin.surname}")
        end
      end

      context 'when name and surname dont exist' do
        let(:admin) { build(:admin, name: '', surname: '') }
        it 'returns email' do
          expect(admin.full_name).to eq(admin.email)
        end
      end
    end
  end
end
