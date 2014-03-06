require_dependency 'issue'

module ChangeAuehorIssuePatch
  def self.included(base) # :nodoc:

    base.class_eval do
      safe_attributes 'author_id',
		:if => lambda {|issue, user| (user.allowed_to?(:edit_issue_author, issue.project))}

      def assignable_users_without_group
        assignable_users.select {|user| !user.has_attribute?(:type) || user.type == "User" }
      end

    end

  end
end