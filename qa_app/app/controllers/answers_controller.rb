class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.new(answer_params)
    @answer.save!
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
