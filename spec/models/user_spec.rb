require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from oauth hash" do
    auth = {
      provider: 'uber',
      uid: 'xxxxxx-yyyyy-zzzz-aaaa-bbbbbbbbbb',
      info: {
        email: 'jonathan.serrano@uber.com',
        first_name: 'Jonathan',
        last_name: 'Serrano',
        picture: 'https://d1w2poirtb3as9.cloudfront.net/default.jpeg',
        promo_code: 'xxxxx',
      },
      credentials: {
        token: 'ABCDEF...',
        refresh_token: 'ABCDEF...',
        expires: true
      },
      extra: {
        email: 'jonathan.serrano@uber.com',
        first_name: 'Jonathan',
        last_name: 'Serrano',
        picture: 'https://d1w2poirtb3as9.cloudfront.net/default.jpeg',
        promo_code: 'xxxxx',
        uuid: 'xxxxxx-yyyyy-zzzz-aaaa-bbbbbbbbbb'
      }
    }
    User.update_or_create(auth)
    new_user = User.first 

    expect(new_user.provider).to eq("uber")
    expect(new_user.uid).to eq("xxxxxx-yyyyy-zzzz-aaaa-bbbbbbbbbb")
    expect(new_user.email).to eq("jonathan.serrano@uber.com")
    expect(new_user.first_name).to eq("Jonathan")
    expect(new_user.last_name).to eq("Serrano")
    expect(new_user.token).to eq("ABCDEF...")
    expect(new_user.refresh_token).to eq("ABCDEF...")
    expect(ew_user.expires).to eq(auth[:credentials][:expires])
  end
end
