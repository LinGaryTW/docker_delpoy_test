class Vote < ApplicationRecord
  belongs_to :link, validate: true
  belongs_to :admin, validate: true
end
