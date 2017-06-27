class Barrel < ActiveRecord::Base
  belongs_to :varietywine
  accepts_nested_attributes_for :varietywine

  validates :location, :date_of_manufacture, :amount, :is_empty, :date_of_filling,  presence: true
  validates :is_empty, inclusion: {in: ['Пустая','Не пустая']}
  validates :amount, numericality: {greater_than_or_equal_to: 0 }



end
