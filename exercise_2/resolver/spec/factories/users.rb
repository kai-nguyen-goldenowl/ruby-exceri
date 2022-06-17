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
FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    password { "MyString" }
    password_digest { "MyString" }
  end
end
