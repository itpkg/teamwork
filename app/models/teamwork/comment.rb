module Teamwork
  class Comment < ActiveRecord::Base
    include Concerns::FakeDestroy

    belongs_to :story, class_name: 'Teamwork::Story'
    belongs_to :owner, class_name: 'User', foreign_key: :user_id

    def info_with_owner_name
      {
        id:         self.id,
        story_id:   self.story_id,
        content:    self.content,
        owner:      self.owner.full_name(I18n.locale),
        updated_at: self.updated_at
      }
    end
  end
end
