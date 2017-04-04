
feature 'viewing links' do
  scenario 'there is a list of links on the homepage' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy') # We used '.create' in
    # IRB to make a student, same here to create the link.
    visit '/links' # Visit the links URL
    expect(page.status_code).to eq 200 # Sanity check to ensure can load the page.

    within 'ul#links' do # Unordered list, link.
      expect(page).to have_content('Makers Academy')
    end
  end
end
