module Teamwork
  class Tag < ActiveRecord::Base
    belongs_to :project, class_name: 'Teamwork::Project'
    has_and_belongs_to_many :stories, class_name: 'Teamwork::Story'
  end
end
