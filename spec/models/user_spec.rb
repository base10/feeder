require "rails_helper"

describe User do
  it { should validate_presence_of :email }
  it do
    create(:user)
    should validate_uniqueness_of :email
  end
  it { should validate_presence_of :name }
  it { should validate_presence_of :password_digest }
  it { should have_many :feeds }
end
