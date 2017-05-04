require './spec/spec_helper'

feature 'adding new sites' do
before do
  DatabaseCleaner.clean
  visit '/links/new'
  fill_in 'new_url', with: 'google.com'
  fill_in 'new_title', with: 'google'
  fill_in 'new_tag', with: 'search'
  click_button 'submit'
end
  scenario 'it can add new links with a title using a form' do
      link = Link.first
      expect(link.tags.map(&:tag_name)).to include('search')
  end
  scenario 'tags are visible on the site' do
      expect(page).to have_content 'search'
  end
  scenario 'selecting a tag I want to see the associated links' do
    click_link 'search'
      expect(page).to have_content 'google'
  end
end
