class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :entries

  validates :name, presence: true
  validates :url, presence: true
  validates :user, presence: true
end
