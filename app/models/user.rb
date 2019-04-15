class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token

  has_secure_password

  has_many :apps
  has_many :jobs, through: :apps
  has_many :tags
  has_many :notes
  has_many :articles

  validates_uniqueness_of :username

  alias :read_attribute_for_serialization :send
  # validates :password, presence: true, length: { in: 6..20 }, allow_nil: false


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end



  def current_user?
    self == current_user
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
