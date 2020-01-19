require 'capybara'
require 'capybara/rspec'
require 'pg'

feature 'Setup database and Log In' do

  scenario 'visiting the index page' do

    connection = PG.connect(dbname: 'peeps_test')
    connection.exec("TRUNCATE peeps;")
    connection.exec("INSERT INTO peeps VALUES(1, 'First Test Peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'other test peep');")

    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end


  feature 'Update status' do


    scenario 'A user wants to update status' do
      visit('chitter')


      has_button? ('Submit')
      fill_in 'status', with: 'Yo my peeps'
      Capybara.using_wait_time(1) do
      click_button 'Submit'
      end
      fill_in 'status', with: 'First Test Peep'
      Capybara.using_wait_time(1) do
      click_button 'Submit'
      end
      fill_in 'status', with: 'other test peep'
      Capybara.using_wait_time(1) do
      click_button 'Submit'

      end
      expect(page).to have_content "Yo my peeps"
      expect(page).to have_content "First Test Peep"
      expect(page).to have_content "other test peep"

    end

    scenario 'Descending order peep' do
      visit('chitter')

      have_selector 'status', text: 'First'
      fill_in 'status', with: 'First'
      click_button 'Submit'


      Capybara.using_wait_time(1) do
        expect(page).to find("//ul/li[1]")
        # expect(find('#message')).to have_text('Complete')
      end

      fill_in 'status', with: 'Second'
      click_button 'Submit'

      expect(page).to have_text 'First'
    end
  end
end
