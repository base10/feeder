require "rails_helper"

feature "User fetches feed", :js do
  scenario "successfully" do
    feed = create(:feed)
    stub_feed_request(feed: feed)
    visit root_path(as: feed.user)

    click_on(t("feeds.buttons.fetch"))

    expect(page).to have_notice(t("feeds.index.fetch", feed_name: feed.name))
  end
end
