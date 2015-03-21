module Teamwork
  class Tag < ActiveRecord::Base
    belongs_to :project, class_name: 'Teamwork::Project'
    has_and_belongs_to_many :stories, class_name: 'Teamwork::Story'

    scope :project_tags, -> (project_id) { where(project_id: project_id) }
  end
end
