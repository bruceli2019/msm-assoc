# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  dob        :string
#  name       :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Actor < ApplicationRecord
    # simplifies the movie counting code
    has_many :roles, :class_name => "Character", :foreign_key => "actor_id"
end
