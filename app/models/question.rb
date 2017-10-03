class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'

  scope :public_questions, -> { where(private: false) }

end
