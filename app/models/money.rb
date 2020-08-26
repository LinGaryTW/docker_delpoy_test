# == Schema Information
#
# Table name: money
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Money < ApplicationRecord
  belongs_to :user
end
