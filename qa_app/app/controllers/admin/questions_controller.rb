class Admin::QuestionsController < ApplicationController
  layout 'second_layout'
  before_action :admin_required

  def index
    @q = Question.all.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to admin_questions_url, notice: "質問「#{question.title}」を削除しました"
  end

  def admin_required
    redirect_to root_path unless current_user.admin
  end
end
