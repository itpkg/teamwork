require_dependency "teamwork/application_controller"

module Teamwork
  class ProjectsController < ApplicationController
    def index
      projects = Teamwork::Project.includes(:stories).active_projects

      render json: projects.map(&:general_info)
    end
  end
end
