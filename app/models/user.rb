class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      email: auth[:info][:email],
      first_name: auth[:info][:first_name],
      last_name: auth[:info][:last_name],
      picture: auth[:info][:picture],
      promo_code: auth[:info][:promo_code],
      token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:token],
      expires: auth[:credentials][:expires]
    }
    user.save!
    user
  end
end
