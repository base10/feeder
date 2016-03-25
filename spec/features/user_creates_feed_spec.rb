require "rails_helper"

feature "User creates feed" do
  scenario "successfully without JavaScript" do
    publication = create(:publication)

    visit feeds_path(as: publication.user)

    click_on(t("feeds.buttons.add"))
    fill_in "Name", with: "Instapaper Folder"
    fill_in "URL", with: "http://example.com/"
    select publication.name, from: "Publication"

    click_button(t("helpers.submit.feed.create"))

    expect(page).to have_feedback(t("feeds.create.success"))
    expect(page).to have_feed("Instapaper Folder")
  end

  scenario "successfully with JavaScript", js: true do
    publication = create(:publication)

    visit feeds_path(as: publication.user)

    click_on(t("feeds.buttons.add"))
    fill_in "Name", with: "Instapaper Folder"
    fill_in "URL", with: "http://example.com/"
    select publication.name, from: "Publication"

    click_button(t("helpers.submit.feed.create"))

    expect(page).to have_feedback(t("feeds.create.success"))
    expect(page).to have_feed("Instapaper Folder")
  end
end
