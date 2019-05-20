class User < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :username


  attr_accessor :remember_token, :activation_token, :reset_token



  has_many :apps
  has_many :jobs, through: :apps
  has_many :tags, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :articles, dependent: :destroy


  alias :read_attribute_for_serialization :send
  # validates :password, presence: true, length: { in: 6..20 }, allow_nil: false



end

  # BEGIN former code
  # def User.new_token
  #   SecureRandom.urlsafe_base64
  # end

  # def User.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end


  # def authenticated?(attribute, token)
  #   digest = send("#{attribute}_digest")
  #   return false if digest.nil?
  #   BCrypt::Password.new(digest).is_password?(token)
  # end



  # def current_user?
  #   self == current_user
  # end

  # def create_activation_digest
  #   self.activation_token  = User.new_token
  #   self.activation_digest = User.digest(activation_token)
  # end
