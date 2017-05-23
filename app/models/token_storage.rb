class TokenStorage < ActiveRecord::Base
  def self.valid?
    expiration = select(:expiration).order(expiration: :desc).first
    expiration && Time.now < expiration
  end

  def self.token
    select(:token).order(expiration: :desc).first
  end

  def self.store(token, expiration)
    create(token: token, expiration: expiration)
  end
end