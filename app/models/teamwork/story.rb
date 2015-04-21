module Teamwork
  class Story < ActiveRecord::Base
    include Concerns::FakeDestroy

    belongs_to :project,  class_name: 'Teamwork::Project'
    has_many   :comments, class_name: 'Teamwork::Comment', dependent: :destroy

    has_and_belongs_to_many :tags, class_name: 'Teamwork::Tag'

    enum status: {submit: 0, processing: 1, finish: 2, reject: 3, done: 9}
    enum flag: {normal: 0, batch: 1}

    # title point tags plan_start_time plan_finish_time description

  end
end
