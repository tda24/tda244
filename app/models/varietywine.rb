class Varietywine < ActiveRecord::Base
  has_many :relationships, dependent: :destroy, inverse_of: :varietywine
  has_many :barrels, dependent: :destroy
  has_many :grapesorts, through: :relationships
  accepts_nested_attributes_for :relationships, allow_destroy: true



  validates :name, :type_of_wine, :color, :aging_in_barrels, :aging_in_bottles, presence: true
  validates :type_of_wine, inclusion: {in: ['Сухое','Полусухое','Полусладкое','Сладкое','Ликёрное', 'Другое']}
  validates :aging_in_barrels, :aging_in_bottles, numericality: {greater_than_or_equal_to: 0 }
  validates :name, uniqueness: {scope: [:type_of_wine, :color, :aging_in_barrels, :aging_in_bottles]}
end

