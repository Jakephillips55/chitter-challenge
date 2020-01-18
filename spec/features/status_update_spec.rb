require 'capybara/rspec'
require 'pg'

feature 'Log In' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

feature 'Update status'
  scenario 'A user wants to update status' do
    visit('chitter')
    connection = PG.connect(dbname: 'peeps_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'First Test Peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'other test peep');")

    fill_in 'status', with: 'Yo my peeps'
    click_button 'Update'

    expect(page).to have_content "Yo my peeps"
    expect(page).to have_content "First Test Peep"
    expect(page).to have_content "other test peep"

  end
end
