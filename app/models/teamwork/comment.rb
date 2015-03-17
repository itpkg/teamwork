module Teamwork
  class Comment < ActiveRecord::Base
    include Concerns::FakeDestroy

    belongs_to :story, class_name: 'Teamwork::Story'
  end
end
