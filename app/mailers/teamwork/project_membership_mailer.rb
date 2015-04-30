module Teamwork
  class ProjectMembershipMailer < ApplicationMailer

    def inform_join_project(user, project)
      @user_name    = user.full_name(I18n.locale)
      @project_name = project.name

      mail(to: user.email, subject: 'Added to a project')
    end

    def inform_leave_project(user, project)
      @user_name    = user.full_name(I18n.locale)
      @project_name = project.name
      mail(to: user.email, subject: 'Removed a project')
    end

  end
end
