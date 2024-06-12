class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :label, use: :slugged

  has_one_attached :image

  validates :label, presence: { message: "Champ libellé requis" }, uniqueness: { message: "La catégorie existe déjà" }
end
