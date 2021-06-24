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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update!(question_params)
    redirect_to questions_url, notice: "質問「#{question.title}」を更新しました。"
  end

  def create
    question = Question.new(question_params)
    question.save!
    redirect_to questions_url, notice: "「#{question.title}を投稿しました」"
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_url, notice: "質問「#{question.title}」を削除しました"
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
