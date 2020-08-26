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
require 'test_helper'

class MoneyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
