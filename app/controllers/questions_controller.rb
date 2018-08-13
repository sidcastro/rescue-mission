class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
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
      redirect_to @question, notice: 'Question posted!'
    else
      render action: 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully deleted!'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
