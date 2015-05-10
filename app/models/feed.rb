class Feed < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true
  validates :user, presence: true
end
