class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions_in_reverse_order = @questions.order(created_at: :desc)
  end
end
