class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    @answers_in_reverse_order = @answers.order(created_at: :desc)
  end

  def show
    @answer = Answer.find(params[:question_id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer= Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer= Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@answer.question), notice: 'Your answer was successfully posted!'
    else
      render :new
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through
  def answer_params
    params.require(:answer).permit(:description)
  end
end
