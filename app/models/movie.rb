# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  year        :string
#  duration    :integer
#  description :text
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#

class Movie < ApplicationRecord
    #from https://guides.rubyonrails.org/active_record_validations.html#presence
    #we want to make sure the director_id and title must be present
    validates :director_id, :title, presence: true
    
    #validates the year
    validates :year, numericality: {
        #note that this is the same as :only_integer => true
        only_integer: true,
        greater_than_or_equal_to: 1870,
        less_than_or_equal_to: 2050
    }
    
    #validates uniqueness of date w/r.t. year
    #https://guides.rubyonrails.org/active_record_validations.html#uniqueness
    validates :title, uniqueness: {
        scope: :year,
        #this is the error message if this is violated
        message: "should be unique with respect to year" 
    }
    
    #validates the duration
    validates :duration, numericality: {
        #note that this is the same as :only_integer => true
        only_integer: true,
        greater_than_or_equal_to: 0,
        less_than_or_equal_to: 2764800,
        #allows there to be a blank input
        allow_blank: true
    }
    
    # this tells Rails to create a method called .director, look up something from the Director table, and can get whatever vallue is associated with the director_id key 
    belongs_to :director, :class_name => "Director", :foreign_key => "director_id"
end
