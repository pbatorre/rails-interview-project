require 'rails_helper'

describe Answer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:provider) }
  end
end
