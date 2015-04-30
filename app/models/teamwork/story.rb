module Teamwork
  class Story < ActiveRecord::Base
    include Concerns::FakeDestroy

    belongs_to :project,  class_name: 'Teamwork::Project'
    belongs_to :owner,    class_name: 'User', foreign_key: :user_id
    has_many   :comments, class_name: 'Teamwork::Comment', dependent: :destroy

    has_and_belongs_to_many :tags, class_name: 'Teamwork::Tag'

    enum status: {submit: 0, processing: 1, finish: 2, reject: 3, done: 9}
    enum flag: {normal: 0, batch: 1}

    def update_status(status, owner)
      if self.status == 'submit'
        self.update(real_start_time: Time.now, status: status, owner: owner)
      elsif status == 9
        self.update(real_finish_time: Time.now, status: status)
      else
        self.update(status: status)
      end
    end
  end
end
