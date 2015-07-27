class Follow < ActiveRecord::Base
  validates :follower_id, presence: true
  validates :login_id, presence: true

  validates_uniqueness_of :follower_id, :scope => :login_id

   belongs_to :login
   belongs_to :follower, class_name: "Login"
end
