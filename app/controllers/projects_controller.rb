class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def show
    @comment = @project.comments.build
    @status_change = @project.status_changes.build
    @conversation_history = fetch_conversation_history(@project.id)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: "Project created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project deleted successfully."
  end

  private

  def fetch_conversation_history(project_id)
  sql = <<-SQL
    SELECT 'comment' AS type, id, content, user_id, NULL AS status, created_at 
    FROM comments 
    WHERE project_id = :project_id
    UNION ALL
    SELECT 'status_change' AS type, id, NULL AS content, user_id, status, created_at 
    FROM status_changes 
    WHERE project_id = :project_id
    ORDER BY created_at ASC
  SQL

  ActiveRecord::Base.connection.execute(
    ActiveRecord::Base.sanitize_sql([sql, { project_id: project_id }])
  ).to_a
end


  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
