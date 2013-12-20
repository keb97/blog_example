# == Schema Information
#
# Table name: discussions
#
#  id         :integer          not null, primary key
#  comment    :text
#  user_id    :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Discussion < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
end
