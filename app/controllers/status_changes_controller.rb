class StatusChangesController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @status_change = @project.status_changes.build(status_change_params)
    @status_change.actor = current_user
    if @status_change.save
      # @project.update(status: @status_change.status)
      redirect_to @project, notice: "Status updated successfully."
    else
      redirect_to @project, alert: "Failed to update status."
    end
  end

  private

  def status_change_params
    params.require(:status_change).permit(:status)
  end
end
