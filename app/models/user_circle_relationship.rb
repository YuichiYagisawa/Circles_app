class UserCircleRelationship < ApplicationRecord
  # belongs_to :user
  belongs_to :circle, inverse_of: :user_circle_relationships

  # validates :user_id, presence: true
  # validates :circle_id, presence: true
end
