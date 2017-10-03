require 'rails_helper'

module Api::V1
  describe QuestionsController, type: :controller do
    render_views

    let!(:asker) { create(:user) }
    let!(:provider) { create(:user) }
    let!(:answer) do
      create(
        :answer,
        question: question,
        provider: provider
      )
    end

    describe 'index' do
      let!(:question) do
        create(
          :question,
          asker: asker
        )
      end
      let(:expected_response) do
        {
          questions: [
            {
              id: question.id,
              title: question.title,
              asker: {
                id: asker.id,
                name: asker.name
              },
              answers: [
                {
                  id: answer.id,
                  body: answer.body,
                  provider: {
                    id: provider.id,
                    name: provider.name
                  }
                }
              ]
            }
          ]
        }.to_json
      end

      before do
        get :index
      end

      it { is_expected.to respond_with 200 }

      it 'returns the expected JSON response' do
        expect(response.body).to eql(expected_response)
      end
    end
  end
end
