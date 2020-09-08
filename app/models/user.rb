# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  emai       :string
#  ammount    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_one :money

  def money_amount
    Rails.cache.fetch("user-follow-count-#{id}-#{updated_at.rfc3339}", expires_in: 1.minutes) do
      money.try(:amount)
    end
  end
end
