require_dependency "teamwork/application_controller"

module Teamwork
  class StoriesController < ApplicationController
    def index
    end

    def show
      story        = Story.includes(:comments, :tags).find(params[:id])
      story_tags   = story.tags.map { |t| {id: t.id, name: t.name} }
      project_tags = Tag.project_tags(story.project_id)

      render json: {story: story, project: story.project, comments: story.comments.order(created_at: :desc),
                    tags: story_tags, project_tags: project_tags}
    end

    def create
      params_for_story = story_params
      tag_ids = process_tags(params_for_story.delete(:tags)) || []

      story = Story.create(params_for_story.merge(status: 0, flag: 0, tag_ids: tag_ids))

      render json: {story: story}
    end

    def update
      params_for_story = story_params
      tag_ids = process_tags(params_for_story.delete(:tags)) || []

      Story.find(params[:id]).update(params_for_story.merge(tag_ids: tag_ids))

      render json: {status: :ok}
    end

    def update_story_status
      Story.find(params[:story_id]).update(status: params[:status])

      render json: {status: :ok}
    end

    def add_comment
      story = Story.find(params[:story_id])

      story.update(progress: params[:new_progress])
      story.comments.create(content: params[:content])

      render json: {status: :ok}
    end

    def destroy
      Story.find(params[:id]).destroy

      render json: {status: :ok}
    end

    private
    def story_params
      params.require(:story).permit(:title, :point, :flag, :tags, :progress, :status, :plan_start_time, :plan_finish_time,
                                    :real_start_time, :real_finish_time, :description, :project_id, tags: [])
    end

    def process_tags(tags)
      return if tags.blank?
      return tags if tags.is_a?(Array)

      tags.split(',').map do |tag|
        Tag.exists?(tag) ? tag : Tag.create(name: tag, project_id: story_params[:project_id]).id
      end
    end
  end
end
