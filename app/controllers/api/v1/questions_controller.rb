module Api::V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question.public_questions
    end

    def show
      @question = Question.find_by(params[:id])

      if @question.blank? || @question.private?
        head :not_found
      end
    end
  end
end
