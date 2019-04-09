# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :post do
    title { "MyString" }
    url { "MyString" }
    content { "MyString" }
    sub_id { 1 }
    author_id { 1 }
  end
end
