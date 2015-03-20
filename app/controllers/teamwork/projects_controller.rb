require_dependency "teamwork/application_controller"

module Teamwork
  class ProjectsController < ApplicationController
    def index
      projects = Teamwork::Project.includes(:stories).active_projects

      render json: projects.map(&:general_info)
    end

    def create
      if Project.create(project_params)
        status = :ok
      else
        status = :error
      end

      render json: {status: status}
    end

    private
    def project_params
      params.require(:project).permit(:name, :description)
    end
  end
end
