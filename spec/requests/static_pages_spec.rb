require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do

    it "should have the content 'Outdoor Journal'" do
      visit root_path
      expect(page).to have_content ('Outdoor Journal')
    end
  end

  describe "Help Page" do
    
    it "should have the content 'Need Help?'" do
      visit help_path
      expect(page).to have_content ('Need Help?')
    end
  end

  describe "About Page" do
    
    it "should have the content 'About Outdoor Journal'" do
      visit about_path
      expect(page).to have_content ('About Outdoor Journal')
    end
  end


end
