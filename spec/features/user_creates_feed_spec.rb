require "rails_helper"

feature "User creates feed" do
  scenario "successfully without JavaScript" do
    user = create(:user)

    visit feeds_path(as: user)

    click_on(t("feeds.buttons.add"))
    fill_in "Name", with: "Instapaper Folder"
    fill_in "URL", with: "http://example.com/"
    click_button(t("helpers.submit.feed.create"))

    expect(page).to have_feedback(t("feeds.create.success"))
    expect(page).to have_feed("Instapaper Folder")
  end

  scenario "successfully with JavaScript", js: true do
    user = create(:user)

    visit feeds_path(as: user)

    click_on(t("feeds.buttons.add"))
    fill_in "Name", with: "Instapaper Folder"
    fill_in "URL", with: "http://example.com/"
    click_button(t("helpers.submit.feed.create"))
    wait_for_ajax

    expect(page).to have_feedback(t("feeds.create.success"))
    expect(page).to have_feed("Instapaper Folder")
  end
end
