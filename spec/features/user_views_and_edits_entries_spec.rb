require "rails_helper"

feature "User views and edits entries" do
  scenario "successfully" do
    user = create(:user)
    feed = create(:feed, user: user)
    entry = create(:entry, feed: feed)

    visit root_path(as: user)
    click_on(feed.name)

    expect(page).to have_feed_entry(entry.headline)

    click_on(entry.headline)

    fill_form(
      :entry,
      headline: "This is an edited headline",
      authorship: "Jane Author",
      summary: "Summary of the article",
      notes: "These are entry notes",
      url: "http://edited-url.example.com"
    )
    click_on submit(:entry, :update)

    expect(page).to have_feedback(t("entries.update.success"))
  end

  scenario "with invalid parameters" do
    user = create(:user)
    feed = create(:feed, user: user)
    entry = create(:entry, feed: feed)

    visit root_path(as: user)
    click_on(feed.name)

    click_on(entry.headline)
    fill_form(:entry, headline: "")
    click_on submit(:entry, :update)

    expect(page).to have_feedback(t("entries.update.failure"))
  end
end
