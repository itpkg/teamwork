module Teamwork
  class Story < ActiveRecord::Base
    include Concerns::FakeDestroy

    belongs_to :project,  class_name: 'Teamwork::Project'
    has_many   :comments, class_name: 'Teamwork::Comment'
  end
end
