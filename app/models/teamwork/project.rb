module Teamwork
  class Project < ActiveRecord::Base
    resourcify
    include Concerns::FakeDestroy

    has_many :stories, class_name: 'Teamwork::Story'
    has_many :tags,    class_name: 'Teamwork::Tag'

    scope :active_projects, -> { where(active: true) }

    def members
      User.with_role(:member, self)
    end

    def general_info
      {
        name: name,
        description: description,
        stories: stories.count,
        members: members.count
      }
    end
  end
end
