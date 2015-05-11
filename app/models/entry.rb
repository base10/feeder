class Entry < ActiveRecord::Base
  belongs_to :feed

  validates :headline, presence: true
  validates :summary, presence: true
  validates :url, presence: true
end
