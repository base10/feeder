class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :feeds

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :url, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
end
