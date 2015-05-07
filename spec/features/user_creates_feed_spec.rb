require "rails_helper"

feature "User creates feed" do
  scenario "successfully" do
    user = create(:user)

    visit feeds_path(as: user)

    click_on(t("feeds.buttons.add"))
    fill_in "Name", with: "Instapaper Folder"
    fill_in "URL", with: "http://example.com/"
    click_button(t("helpers.submit.feed.create"))

    expect(page).to have_feedback(t("feeds.create.success"))
    expect(page).to have_feed("Instapaper Folder")
  end
end
