class AnswersController < ApplicationController
  def index
    @answers = Answer.all
    @question = Question.find(params[:question_id])
    @answer.question = @question
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

  def answer_params
    params.require(:answer).permit(:description)
  end
end
