class Extend < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  validates :body, :story, :user, presence: true
  validates :body, length: { minimum: 140, maximun: 240 }
end
