require "spec_helper"

describe Feeder::Feed do
  describe "#new" do
    it "initializes" do
      expect { Feeder::Feed.new }.not_to raise_error
    end
  end
end
