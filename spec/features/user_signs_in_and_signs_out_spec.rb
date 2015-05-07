require "rails_helper"

feature "User signs in, then signs out" do
  scenario "successfully" do
    user = create(:user)

    visit sign_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest

    click_button t("sign_in.link")

    expect(page).to have_feedback(t("sessions.create.success"))

    click_on t("sign_out.link")

    expect(page).to have_feedback(t("sessions.destroy.success"))
  end
end
