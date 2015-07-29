class Post < ActiveRecord::Base
  validates_presence_of :login_id
  belongs_to :login
end
