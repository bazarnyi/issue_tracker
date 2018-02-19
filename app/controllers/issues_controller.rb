class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_issue, only: [:show, :edit, :update]

  def index
    @issues = policy_scope(Issue)
  end

  def new
    @issue = Issue.new
  end

  def create
    issue_params = params.require(:issue).permit(:title, :description)

    @issue = Issue.new(issue_params)
    @issue.user = current_user

    if @issue.save
      redirect_to root_url, notice: 'Issue was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    issue_params = params.require(:issue).permit(:state)

    if @issue.update(issue_params)
      redirect_to root_url, notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize Issue

    issue = Issue.find(params[:id])
    issue.destroy

    redirect_to root_url, notice: 'Issue was successfully deleted.'
  end

  private

  def find_issue
    @issue = policy_scope(Issue).find(params[:id])
  end
end
