require "rails_helper"

describe Feed do
  describe "validations" do
    subject { create(:feed) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :url }
    it { should validate_presence_of :user }
    it { should belong_to :user }
  end
end
