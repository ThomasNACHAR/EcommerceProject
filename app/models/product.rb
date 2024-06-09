class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :label, use: :slugged

  has_one_attached :image
end
