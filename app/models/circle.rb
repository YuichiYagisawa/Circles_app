class Circle < ApplicationRecord
  has_many :microposts, dependent: :destroy
  before_save { self.circle_email = circle_email.downcase }
  validates :circle_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :circle_email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :circle_info, presence: true
end
