module Api::V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question.public_questions
    end
  end
end
