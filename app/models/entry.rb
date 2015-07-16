class Entry < ActiveRecord::Base
  belongs_to :feed

  validates :feed_id, presence: true
  validates :headline, presence: true
  validates :summary, presence: true
  validates :url, presence: true, uniqueness: { scope: :feed_id }
end
