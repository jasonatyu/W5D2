# == Schema Information
#
# Table name: comments
#
#  id                :bigint(8)        not null, primary key
#  content           :text             not null
#  author_id         :integer          not null
#  post_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

FactoryBot.define do
  factory :comment do
    content { "MyText" }
    author_id { 1 }
    post_id { 1 }
  end
end
