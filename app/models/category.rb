class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :label, use: :slugged

  has_many :products

  validates :label, presence: { message: "Champ libellé requis" }, uniqueness: { message: "La catégorie existe déjà" }
end
