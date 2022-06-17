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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:follower_relationships).class_name('Relationship') }
    it { should have_many(:following_relationships).class_name('Relationship') }
    it { should have_many(:follower_relationships).with_foreign_key('following_id') }
    it { should have_many(:following_relationships).with_foreign_key('follower_id') }
    it { should have_many(:following_relationships).dependent(:destroy) }
    it { should have_many(:follower_relationships).dependent(:destroy) }
    it { should have_many(:followers).through(:follower_relationships) }
    it { should have_many(:followings).through(:following_relationships) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end

  describe 'class method' do

  end
end
