class User < ActiveRecord::Base
  has_secure_password

  has_many :images
  has_many :recipes

  validates :email,
    presence: true,
    uniqueness: true,
    format: {
      with: /.+@.+\..+/,
      message: 'must be the correct format'
    }
  validates :password, unless: 'password.blank?',
    format: {
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*(_|[^\w]|\d)).+\z/,
      message: 'must meet the security requirements'
    },
    length: { minimum: 6 }

  def self.login(email, password)
    User.find_by(email: email).try(:authenticate, password)
  end

  def admin?
    admin == 1
  end
end
