class Micropost < ApplicationRecord
  # belongs_to :user
  belongs_to :circle
  # default_scope -> {order(:created_at: :desc)}
  validates :circle_id, presence: true
  # validates :user_id, presence: true
  validates :content, presence: true

  def circle
    return Circle.find_by(id: self.circle_id)
  end
end
