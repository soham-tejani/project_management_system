class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to @project, notice: "Comment added successfully."
    else
      redirect_to @project, alert: "Failed to add comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
