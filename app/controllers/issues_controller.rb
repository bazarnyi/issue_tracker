class IssuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @issues = policy_scope(Issue)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user

    if @issue.save
      redirect_to root_url, notice: 'Issue was successfully created.'
    else
      render :new
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def destroy
    authorize Issue

    issue = Issue.find(params[:id])
    issue.destroy

    redirect_to root_url, notice: 'Issue was successfully deleted.'
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
