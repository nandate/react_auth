class User < ApplicationRecord
  before_save :downcase_email
  before_create :generate_access_token

  has_many :borrowed_products, foreign_key: "borrower_id", class_name: "Product"
  has_many :borrowed_and_products, ->{ where("is_rent is not NULL")}, foreign_key: "borrower_id", class_name: "Product"
  has_many :saling_products, ->{ where("borrower_id is NULL") }, foreign_key: "seller_id", class_name: "Product"
  has_many :sold_products, ->{ where("borrower_id is not NULL") }, foreign_key: "seller_id", class_name: "Product"



  validates :name, presence: true, length: { maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255},
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length:{ minimum: 6}


  def User.new_token
    SecureRandom.urlsafe_base64
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  def generate_access_token
    begin
      self.access_token = User.new_token
    end while self.class.exists?(access_token: access_token)
  end

end
