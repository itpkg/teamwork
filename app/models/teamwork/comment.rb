module Teamwork
  class Comment < ActiveRecord::Base
    include Concerns::FakeDestroy
    resourcify

    belongs_to :story, class_name: 'Teamwork::Story'

    def owner
      User.with_role(:owner, self).first
    end

    def update_owner(user)
      if self.owner.present?
        self.owner.remove_role :owner, self
      else
        user.add_role :owner, self
      end
    end

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
