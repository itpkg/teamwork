module Teamwork
  class Tag < ActiveRecord::Base
    belongs_to :project, class_name: 'Teamwork::Project'
  end
end
