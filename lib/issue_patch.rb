require_dependency 'issue'

module ChangeAuehorIssuePatch
  def self.included(base) # :nodoc:

    base.class_eval do
      safe_attributes 'author_id',
        :if => lambda {|issue, user| (user.allowed_to?(:edit_issue_author, issue.project))}

      def all_users
        User.active.uniq
      end

    end

  end
end
