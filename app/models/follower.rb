class Follower < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  validates :user, :story, presence: true
end
