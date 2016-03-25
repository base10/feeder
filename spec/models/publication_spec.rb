require "rails_helper"

describe Publication do
  describe "validations" do
    subject { create(:publication) }

    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
    it { should validate_presence_of :url }
    it { should validate_uniqueness_of(:url).scoped_to(:user_id) }
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
    it { should have_many :feeds }
  end
end
