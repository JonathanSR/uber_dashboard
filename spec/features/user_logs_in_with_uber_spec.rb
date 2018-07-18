require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using uber oauth" do
      stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Uber")
    click_link "Sign in with Uber"   
    expect(current_path).to eq(dashboards_path)
    expect(page).to have_content("Jonathan")
    expect(page).to have_link("Logout")
  end
end 

