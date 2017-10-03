require 'rails_helper'

describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:asker) }
  end
end
