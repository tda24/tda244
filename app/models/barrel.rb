class Barrel < ActiveRecord::Base
  belongs_to :varietywine
  accepts_nested_attributes_for :varietywine

  validates :location, :date_of_manufacture, :amount, :is_empty, :date_of_filling,  presence: true
  validates :is_empty, inclusion: {in: ['Пустая','Не пустая']}
  validates :amount, numericality: {greater_than_or_equal_to: 0 }

  def date_of_manufacture_cannot_be_in_the_future
    unless date_of_manufacture.nil?
      if date_of_manufacture > Date.today
        errors.add(:date_of_manufacture, "не может быть установленна будущим временем")
      end
    end
  end

  def date_of_completion_cannot_be_in_the_future
    unless date_of_completion.nil?
      if date_of_completion > Date.today
        errors.add(:date_of_completion, "не может быть установленна будущим временем")
      end
    end
  end

  def date_of_manufacture_cannot_be_more_than_date_of_completion
    unless date_of_filling.nil?
        if date_of_filling < date_of_manufacture
          errors.add(:date_of_filling, "не может быть раньше даты изготовления")
        end
    end
  end

  def self.search(params)
     result = Barrel.includes(:varietywine => {:relationships => :grapesort}).references(:varietywine => {:relationships => :grapesort})
     if params['location'].present?
       result = result.where(location: params['location'])
     end
     if params['date_of_manufacture'].present?
       result = result.where(date_of_manufacture: params['date_of_manufacture'])
     end
     if params['date_of_filling'].present?
       result = result.where(date_of_filling: params['date_of_filling'])
     end
     if params['amount'].present?
       result = result.where(amount: params['amount'])
     end
     if params['is_empty'].present?
       result = result.where(is_empty: params['is_empty'])
     end
     if params['type_of_wine'].present?
       result = result.where(varietywines: {type_of_wine: params['type_of_wine']})
     end
     if params['wine_name'].present?
       result = result.where(varietywines: {name: params['wine_name']})
     end
     if params['color'].present?
       result = result.where(varietywines: {color: params['color']})
     end
     if params['aging_in_barrels'].present?
       result = result.where(varietywines: {aging_in_barrels: params['aging_in_barrels']})
     end
     if params['aging_in_bottles'].present?
       result = result.where(varietywines: {aging_in_bottles: params['aging_in_bottles']})
     end
     if params['ratio'].present?
       result = result.where(relationships: {ratio: params['ratio']})
     end
     if params['grape_name'].present?
       result = result.where(grapesorts: {name: params['grape_name']})
     end
     if params['place_of_production'].present?
       result = result.where(grapesorts: {place_of_production: params['place_of_production']})
     end
     if params['date_of_collection'].present?
       result = result.where(grapesorts: {date_of_collection: params['date_of_collection']})
     end
     result.all
  end
end



