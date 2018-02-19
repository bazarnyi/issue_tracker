class IssuePolicy
  attr_reader :user, :issue

  def initialize(user, issue)
    @user = user
    @issue = issue
  end

  def destroy?
    user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        user.issues
      end
    end
  end
end
