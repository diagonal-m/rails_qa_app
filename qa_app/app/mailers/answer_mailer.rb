class AnswerMailer < ApplicationMailer
  def creation_email(answer)
    @answer = answer
    answer_email = [answer.question.user.email]
    related_address = answer.question.answers.inject(answer_email) { |result, n| result + [n.user.email] }.uniq
    to = related_address.reject { |email| email == answer.user.email }

    mail(
      subject: '質問に回答がありました',
      to: to
    )
  end
end
