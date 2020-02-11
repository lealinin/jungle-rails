class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:minimum => 7},
                       :on => :create
  # validates :password, presence: true
  # validates :password, length: {:minimum => 7}
  validates :password_confirmation, presence: true

  def authenticate_with_credentials
  end

end