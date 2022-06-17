# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :bigint           not null
#  following_id :bigint           not null
#
# Indexes
#
#  index_relationships_on_follower_id                   (follower_id)
#  index_relationships_on_follower_id_and_following_id  (follower_id,following_id) UNIQUE
#  index_relationships_on_following_id                  (following_id)
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#  fk_rails_...  (following_id => users.id)
#
class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'

  # validates
  validates :follower_id, presence: true, uniqueness: { scope: [:following_id] }
  validates :following_id, presence: true, uniqueness: { scope: [:follower_id] }
  validate :following_cannot_be_same_follower

  # scopes
  scope :top_most_followers_ids, -> (number){ group(:following_id).order('COUNT(follower_id) DESC').count.keys[0..number - 1] }

  private
  def following_cannot_be_same_follower
    self.errors.add(:follower, "cannot follow yourself") if following_id == follower_id
  end
end
