class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy # quand je detruis un cocktail il va detruire toutes les doses associees
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
end
