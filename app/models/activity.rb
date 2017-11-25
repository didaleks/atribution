class Activity < ActiveRecord::Base
  has_many :visitors, through: :histories
  has_many :mediums, through: :histories
  has_many :histories, foreign_key: 'activity_id'

  def proceeds
    (apru * visitors.count).round
  end

  def apru_round
    apru.round
  end

  def find_mediums
    histories.find_by(activity_id: id) # TODO: находит первую запись, а надо чтобы находил все и выводил данные в тублицу по всем каналам

  end

  def medium_title
    mediums.find_by(find_mediums.medium_id).title
  end

  def mediums_count
    History.where(medium_id: find_mediums.medium_id).count
  end

  def mediums_proceed
    (apru * mediums_count).round
  end
end
