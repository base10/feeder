require "rails_helper"

feature "User views feeds and edits feed" do
  scenario "successfully" do
    user = create(:user)
    feed = create(:feed, user: user)
    other_feed = create(:feed, user: create(:user))

    visit root_path(as: user)
    expect(page).to have_feed(feed.name)
    expect(page).not_to have_feed(other_feed.name)

    click_on("Edit feed")
    expect(page).to have_header(t("feeds.edit.title", feed: feed.name))

    fill_in "Name", with: "Updated feed"
    fill_in "URL", with: "http://example.com/updated-feed.rss"
    click_on(t("helpers.submit.feed.update"))

    expect(page).to have_feedback(t("feeds.update.success"))
  end
end
