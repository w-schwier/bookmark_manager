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

  scenario 'create a tag when saving link' do
    visit '/links/new'
    fill_in :title, with: "icanhazburgers"
    fill_in :url, with: "http://icanhas.cheezburger.com/cats"
    fill_in :tags, with: "animal"
    click_button "Save link"

    expect(current_path).to eq '/links'
    link = Link.first
    expect(link.tags.map(&:name)).to include("animal")
  end
end
