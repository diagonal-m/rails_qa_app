class QuestionMailer < ApplicationMailer
  def creation_email(question)
    @question = question
    to = User.all.map { |user| user.email if user.email != @question.user.email }.compact
    mail(
      subject: '質問が投稿されました',
      to: to
    )
  end
end
