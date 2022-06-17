# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # relationships
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :following_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :followings, through: :following_relationships

  # validates
  validates :username, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }

  # class method
  def self.top_most_followers(num = 9)
    ids = Relationship.top_most_followers_ids(num)

    where(id: ids).sort_by {|p| ids.index(p.id) }
  end

  # instance method
  def is_follower?(user_id)
    followers.where(follower_id: user_id).present?
  end

  def is_following?(user_id)
    followings.where(follower_id: user_id).present?
  end

  def follow(user_id)
    Relationship.create(following_id: user_id, follower_id: self.id)
  end

  def unfollow(user_id)
    following.find(following_id: user_id).destroy
  end

  def newest_follower_current_month(range_time = [DateTime.now.beginning_of_month, DateTime.now.end_of_month])
    followers.where(created_at: range_time[0]..range_time[1]).order(created_at: :desc)
  end
end
