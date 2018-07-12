class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions_in_reverse_order = @questions.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answers_in_reverse_order = @answers.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully posted!'
    else
      render action: 'new'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
