class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    question = Question.new(question_params)
    question.save!
    redirect_to questions_url, notice: "「#{question.title}を投稿しました」"
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
