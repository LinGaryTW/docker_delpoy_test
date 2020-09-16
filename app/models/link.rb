class Link < ApplicationRecord
  belongs_to :admin, optional: true # prevent ActiveRecord::RecordInvalid
  has_many :votes

  validates :url, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
end
