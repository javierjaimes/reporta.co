class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :invitable, :invite_for => 2.weeks, :invitation_limit => 10



  has_many :stories, inverse_of: :user
  has_many :invitations, :class_name => self.to_s, :as => :invited_by
end
