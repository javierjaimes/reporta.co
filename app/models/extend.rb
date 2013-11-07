class Extend < ActiveRecord::Base
  include ExtendConcerns


  belongs_to :user
  belongs_to :story

  validates :body, :story, :user, presence: true
  validates :body, length: { minimum:   5, maximun: 240 }
end
