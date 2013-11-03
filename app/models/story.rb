class Story < ActiveRecord::Base
  belongs_to :user
  has_many :extends
  has_many :followers, inverse_of: :story

  validates :body, :user, presence: true
  validates :body, length: { minimum: 140, maximun: 240 }
end
