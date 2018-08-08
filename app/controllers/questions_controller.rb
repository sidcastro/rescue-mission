class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions_in_reverse_order = @questions.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end
end
