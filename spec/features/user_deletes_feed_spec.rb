require "rails_helper"

feature "User deletes feed" do
  scenario "successfully" do
    feed = create(:feed)

    visit feeds_path(as: feed.user)
    click_on(t("feeds.buttons.destroy"))

    expect(page).to have_feedback(t("feeds.destroy.success"))
    expect(page).not_to have_feed(feed.name)
  end
end
