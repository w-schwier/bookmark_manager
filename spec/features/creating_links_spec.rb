feature "user can add links" do
  scenario "save links to database" do
    visit '/links/new'
    fill_in :title, with: "icanhazburgers"
    fill_in :url, with: "http://icanhas.cheezburger.com/cats"
    click_button "Save link"

    expect(current_path).to eq '/links'

    within "ul#links" do
      expect(page).to have_content("icanhazburgers")
    end
  end
end
