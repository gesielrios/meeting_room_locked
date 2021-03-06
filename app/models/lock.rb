class Lock < ApplicationRecord
    belongs_to :user
    belongs_to :week
    
    validates :user, :presence => true
    validates :week, :presence => true

    validates :time_start, :presence => true
    validates :time_end, :presence => true
    validates :day_index, :presence => true

    validates_uniqueness_of :time_start, :scope => [:day_index, :week_id]
end
