class IssuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @issues = policy_scope(Issue)
  end

  def destroy
    authorize Issue

    issue = Issue.find(params[:id])
    issue.destroy

    redirect_to root_url, notice: 'Issue was successfully deleted.'
  end
end
