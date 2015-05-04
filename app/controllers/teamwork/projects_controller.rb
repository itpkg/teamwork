require_dependency "teamwork/application_controller"

module Teamwork
  class ProjectsController < ApplicationController
    def index
      projects = Teamwork::Project.includes(:stories).active_projects

      render json: projects.map(&:general_info)
    end

    def show
      project = Teamwork::Project.includes(:stories, :tags).where(id: params[:id], active: true).first
      members = User.with_role(:member, project)
      users   = User.where.not(id: members.map(&:id)).order(:first_name)
      stories = project.stories.where(active: true).order(:id)

      story_owners = {}
      stories.each { |s| story_owners.merge!({s.id => s.owner.try(:full_name, I18n.locale)}) }

      render json: {
               project: project,
               stories: stories,
               story_owners: story_owners,
               members: members - User.with_role(:creator, project),
               users: users,
               tags: project.tags
             }
    end

    def tags
      render json: {tags: Teamwork::Tag.where(project_id: params[:project_id])}
    end

    def create
      project = Project.create(project_params)
      current_user.add_role :member, project
      current_user.add_role :creator, project

      render json: {project: project}
    end

    def update
      id = project_params.delete(:id)

      project = Project.find(id)
      project.update(project_params)

      render json: {status: :ok}
    end

    def destroy
      Project.find(params[:id]).destroy

      render json: {status: :ok}
    end

    def add_members
      project = Project.find(params[:project_id])
      users   = User.where(id: params[:user_ids])

      users.each do |u|
        u.add_role :member, project
        ProjectMembershipMailer.inform_join_project(u, project).deliver_now
      end

      render json: {status: :ok}
    end

    def remove_member
      project = Project.find(params[:project_id])
      user    = User.find(params[:user_id])

      user.remove_role :member, project
      ProjectMembershipMailer.inform_leave_project(user, project).deliver_now

      render json: {status: :ok}
    end

    private
    def project_params
      params.require(:project).permit(:id, :name, :description, :status)
    end
  end
end
