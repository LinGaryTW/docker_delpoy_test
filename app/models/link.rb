class Link < ApplicationRecord
  belongs_to :admin, optional: true # prevent ActiveRecord::RecordInvalid

  has_many :votes
end
