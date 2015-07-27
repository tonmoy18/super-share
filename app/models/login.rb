class Login < ActiveRecord::Base
  validates :username, presence: true
  validates :password_hash, presence: true

  has_many :follows
  has_many :followers, through: :follows
  has_many :inverse_follows, class_name: "Follow", foreign_key: "follower_id"
  has_many :inverse_followers, through: :inverse_follows, source: :login

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
