class User < ActiveRecord::Base
  has_many :orders
  has_many :reviews
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /\A\s*.*\s*\z/
  validates :password, presence: true
  validates :password_confirmation, presence: true, length: { minimum: 5 }

def self.authenticate_with_credentials(email, password)
  user = User.find_by_email(email)
  # user = User.where("replace(email, ' ', '') = 'email'")
  if user.authenticate(password)
    return user
  else
    return nil
  end
end
end
