class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers  # 質問詳細に関連づけられている回答を全取得
    @answer = current_user.answers.new  # 投稿詳細画面で回答投稿を行うため、formのパラメータ用にAnswerオブジェクトを取得
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
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to questions_path, notice: "「#{@question.title}を投稿しました」"
    else
      render :new
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_url, notice: "質問「#{question.title}」を削除しました"
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :solved)
  end
end
