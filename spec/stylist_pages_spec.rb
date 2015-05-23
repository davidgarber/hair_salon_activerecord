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

  describe('the stylists path') do
    it('visits the index') do
      visit('/')
      click_link('View all stylists')
      fill_in('name', with: 'Sarah')
      click_button('Submit')
      expect(page).to have_content('Sarah')
    end
  end

  describe('the stylist detail') do
    it('visits the index') do
      visit('/')
      click_link('View all stylists')
      fill_in('name', with: 'Sarah')
      click_button('Submit')
      click_link('Sarah')
      expect(page).to have_content('Sarah')
    end
  end

  describe('update the stylist') do
    it('visits the index') do
      visit('/')
      click_link('View all stylists')
      fill_in('name', with: 'Sarah')
      click_button('Submit')
      click_link('Sarah')
      fill_in('new_name', with: 'Paula')
      click_button('Update')
      expect(page).to have_content('Paula')
    end
  end

  describe('delete the stylist') do
    it('visits the index') do
      visit('/')
      click_link('View all stylists')
      fill_in('name', with: 'Sarah')
      click_button('Submit')
      click_link('Sarah')
      click_button('Delete this stylist')
      expect(page).to have_content('')
    end
  end
end
