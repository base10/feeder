require "rails_helper"

describe Entry do
  describe "validation" do
    subject { create(:entry) }
    it { should validate_presence_of :headline }
    it { should validate_presence_of :url }
    it { should validate_presence_of :summary }
  end
end
