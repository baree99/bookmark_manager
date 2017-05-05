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
  scenario 'ability to add multiple tags' do
    visit '/links/new'
    fill_in 'new_url', with: 'bbc.co.uk'
    fill_in 'new_title', with: 'BBC'
    fill_in 'new_tag', with: 'news;sports'
    click_button 'submit'
    tags = [Link.all(:title => 'BBC').tags.first.tag_name, Link.all(:title => 'BBC').tags.last.tag_name]
     expect(tags).to eq ['news', 'sports']
  end
end
