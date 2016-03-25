require "rails_helper"

feature "User creates publication" do
  scenario "successfully" do
    user = create(:user)

    visit publications_path(as: user)

    click_on(t("publications.buttons.add"))

    # FIXME: Find the thoughtbot lib for working with simpleform in specs
    # and filling things in more tersely

    fill_in "Name", with: "Learning Log"
    fill_in "Description", with: "A publication of technical learning."
    fill_in "Url", with: "https://foo.example.com/"
    click_button(t("helpers.submit.publication.create"))

    expect(page).to have_feedback(t("publications.create.success"))
    expect(page).to have_publication("Learning Log")
  end
end
