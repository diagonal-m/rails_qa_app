class QuestionsController < ApplicationController
  def index
    @q = Question.all.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
    solved = !params['solved'].to_i.zero?
    @questions = @questions.where(solved: solved).page(params[:page]) if solved
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
    if question_params['solved']
      redirect_back(fallback_location: root_path)
    else
      redirect_to questions_url, notice: "質問「#{question.title}」を更新しました。"
    end
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      QuestionMailer.creation_email(@question).deliver_now
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
