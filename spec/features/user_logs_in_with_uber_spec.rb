require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
      stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Uber")
    click_link "Sign in with Uber"
    expect(page).to have_content("Jonathan")
    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
  
    OmniAuth.config.mock_auth[:uber] = 
    OmniAuth::AuthHash.new({
      provider: 'uber',
      uid: 'xxxxxx-yyyyy-zzzz-aaaa-bbbbbbbbbb',
      info: {
        email: 'jonathan.serrano@uber.com',
        first_name: 'Jonathan',
        last_name: 'Serrano',
        picture: 'https://d1w2poirtb3as9.cloudfront.net/default.jpeg',
        promo_code: 'xxxx',
      },
      credentials: {
        token: 'ABCDEF',
        refresh_token: 'ABCDEF',
        expires: true
      },
      extra:{
        email: 'jonathan.serrano@uber.com',
        first_name: 'Jonathan',
        last_name: 'Serrano',
        picture: 'https://d1w2poirtb3as9.cloudfront.net/default.jpeg',
        promo_code: 'xxxx',
        uuid: 'xxxxxx-yyyyy-zzzz-aaaa-bbbbbbbbbb'
      }
    })
  end
end 

