class Response < ActiveRecord::Base
  validates :response, :user_id, presence: true
  validate :not_duplicate_response, :author_cannot_respond_to_self_post

  belongs_to :answer_choices,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: "AnswerChoice"

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  has_one :question,
    through: :answer_choices,
    source: :question

  def author_cannot_respond_to_self_post
    # self_ac = AnswerChoice.where(id: self.answer_choice_id)
    # question = Question.where(id: self_ac.question_id)
    # poll = Poll.where(id: question.poll_id)
    if question.poll.author_id == self.user_id
      errors[:respondent] << "cannot be the author"
    end
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:respondent] << "has already answered"
    end
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

end
