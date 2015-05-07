class User < ActiveRecord::Base
  has_many :feeds

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true
end
