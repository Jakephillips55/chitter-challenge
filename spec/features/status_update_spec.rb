require 'capybara/rspec'

feature 'posting a chit' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'A user wants to update status' do
    visit('/chitter')
    fill_in 'status', with: 'Yo my peeps'
    click_button('Update')

    expect(page).to have_content "Chitter"
  end
end
