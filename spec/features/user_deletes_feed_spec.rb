require "rails_helper"

feature "User deletes feed" do
  scenario "successfully" do
    user = create(:user)
    feed = create(:feed, user: user)

    visit root_path(as: user)
    click_on(t("feeds.buttons.destroy"))

    expect(page).to have_feedback(t("feeds.destroy.success"))
    expect(page).not_to have_feed(feed.name)
  end
end
