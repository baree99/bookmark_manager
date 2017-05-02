require './spec/spec_helper'
feature 'Viewing list of links' do
  scenario 'views list of links on link page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'url#links' do
    expect(page).to have_content ('Makers Academy')
    end
  end
end




# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
