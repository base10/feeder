require "rails_helper"

feature "User signs up for service" do
  scenario "successfully" do
    visit sign_up_path

    fill_in "Name", with: "Nathan"
    fill_in "Email", with: "nathan@example.com"
    fill_in "Password", with: "foobarbaz"

    click_on "Sign up"

    expect(page).to have_message(t("sign_up.success"))
  end
end
