class Order < ApplicationRecord
  belongs_to :user
  belongs_to :chip
  monetize :amount_cents
end
