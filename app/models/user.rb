# Lifted from Clearance::User

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,                :type => String
  field :email,               :type => String
  field :encrypted_password,  :type => String
  field :password_salt,       :type => String
  
  validates_presence_of   :email, :name
  validates_uniqueness_of :email
  validates_format_of     :email, :with => %r{.+@.+\..+}
  
  validates_presence_of     :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  
  before_save :initialize_salt, :encrypt_password
  
  attr_accessor :password, :password_confirmation
  
  class << self
    def authenticate(email, password)
      return nil  unless user = criteria.where(:email => email).first
      return user if     user.authenticated?(password)
    end    
  end
  
  def authenticated?(password)
    encrypted_password == encrypt(password)
  end
  
  protected
    
    def encrypt_password
      self.encrypted_password = encrypt(password)
    end
    
    def generate_hash(string)
      Digest::SHA1.hexdigest(string)
    end
    
    def initialize_salt
      if new_record?
        self.password_salt = generate_hash("--#{Time.now.utc}--#{password}--")
      end
    end
    
    def encrypt(string)
      generate_hash("--#{password_salt}--#{string}--")
    end
    
    def password_required?
      encrypted_password.blank? || !password.blank?
    end
  
end