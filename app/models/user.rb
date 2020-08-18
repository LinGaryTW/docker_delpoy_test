class User < ApplicationRecord
  has_one :money

  def money_amount
    Rails.cache.fetch("user-follow-count-#{id}-#{updated_at.rfc3339}", expires_in: 1.minutes) do
      money.amount
    end
  end
end
