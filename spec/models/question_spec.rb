require 'rails_helper'

describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:asker) }
  end

  describe 'scopes' do
    describe '.public_questions' do
      let!(:public_question) do
        create(
          :question,
          private: false
        )
      end
      let!(:private_question) do
        create(
          :question,
          private: true
        )
      end

      it 'returns questions where private is false' do
        expect(described_class.public_questions)
          .to eq([public_question])
      end
    end
  end
end
