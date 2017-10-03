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

    describe 'show' do
      let!(:question) do
        create(
          :question,
          private: private_attr,
          asker: asker
        )
      end

      before do
        get :show, id: question.id
      end

      context 'when question is public' do
        let(:private_attr) { false }

        let(:expected_response) do
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
          }.to_json
        end

        it 'returns the expected JSON response' do
          expect(response.body).to eql(expected_response)
        end
      end

      context 'when question is private' do
        let(:private_attr) { true }

        it { is_expected.to respond_with 404 }
      end
    end
  end
end
