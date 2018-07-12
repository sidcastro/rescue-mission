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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully deleted!'
  end

    private

    # Never trust parameters from the scary internet, only allow the white list through
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
