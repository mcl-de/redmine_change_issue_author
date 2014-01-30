require 'redmine'

require_dependency 'issue_patch'
require_dependency 'issues_helper_patch'

Rails.configuration.to_prepare do
  unless Issue.included_modules.include?(ChangeAuehorIssuePatch)
      Issue.send(:include, ChangeAuehorIssuePatch)
  end
  
  unless IssuesHelper.included_modules.include?(IssuesHelperPatch)
      IssuesHelper.send(:include, IssuesHelperPatch)
  end
end

Redmine::Plugin.register :redmine_change_issue_author do
  name 'Change issue author plugin'
  author 'Frederik Jung'
  description 'This plugin provides the ability to change the issue author'
  version '0.0.1'
  url 'http://mcl.de'
  author_url 'mailto:frederik.jung@mcl.de'
  requires_redmine :version_or_higher => '2.0.0'
  
  project_module :issue_tracking do
    permission :edit_issue_author, {}
  end
end