require "rails_helper"

feature "User views feeds and edits feed" do
  scenario "successfully" do
    feed = create(:feed)
    other_feed = create(:feed, user: create(:user))

    visit feeds_path(as: feed.user)
    expect(page).to have_feed(feed.name)
    expect(page).not_to have_feed(other_feed.name)
    expect(page).to have_feed_host(feed.url)

    click_on(t("feeds.buttons.edit"))
    expect(page).to have_header(t("feeds.edit.title", feed: feed.name))

    fill_in "Name", with: "Updated feed"
    fill_in "URL", with: "http://example.com/updated-feed.rss"
    click_on(t("helpers.submit.feed.update"))

    expect(page).to have_feedback(t("feeds.update.success"))
  end
end
