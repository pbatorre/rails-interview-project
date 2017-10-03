require 'rails_helper'

module Api::V1
  describe ApplicationController, type: :controller do

    controller do
      def index
        head :ok
      end
    end

    describe 'before_action filter' do
      context 'when API key is valid' do

        include_context 'authorize'

        before do
          get :index
        end

        it 'increments the authorized tenant\'s request count' do
          expect(tenant.reload.request_count).to eq 1
        end
      end

      context 'when API key is invalid' do
        before do
          get :index
        end

        it { is_expected.to respond_with 401 }
      end

    end
  end
end
