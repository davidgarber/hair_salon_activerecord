require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The app', :type => :feature) do
  describe('the root path') do
    it('visits the index') do
      visit('/')
      expect(page).to have_content('Salon')
    end
  end

  describe('the clients path') do
      it('visits the index') do
        visit('/')
        click_link('View all clients')
        fill_in('name', with: 'Julie')
        click_button('Submit')
        expect(page).to have_content('Julie')
      end
    end

  describe('the clients detail') do
    it('visits the index') do
      visit('/')
      click_link('View all clients')
      fill_in('name', with: 'Julie')
      click_button('Submit')
      click_link('Julie')
      expect(page).to have_content('Julie')
    end
  end

  describe('update the client') do
    it('visits the index') do
      visit('/')
      click_link('View all clients')
      fill_in('name', with: 'Julie')
      click_button('Submit')
      click_link('Julie')
      fill_in('new_name', with: 'Mary')
      click_button('Update')
      expect(page).to have_content('Mary')
    end
  end
end
