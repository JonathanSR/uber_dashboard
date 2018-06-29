require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
      stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Uber")
    click_link "Sign in with Uber"
    expect(page).to have_content("Jonathan Serrano")
    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
  
    OmniAuth.config.mock_auth[:uber] = 
    OmniAuth::AuthHash.new({
  
    })
  end
end 

