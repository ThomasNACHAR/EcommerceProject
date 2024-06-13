class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :label, use: :slugged

  belongs_to :category
end
