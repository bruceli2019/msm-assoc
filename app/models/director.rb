# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  dob        :string
#  name       :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
    # this creates a method called .movies for director objects, looks for values in Movie table with director_id key
    has_many :movies, :class_name => "Movie", :foreign_key => "director_id"
end
