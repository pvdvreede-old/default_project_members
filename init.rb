require_dependency 'project_patch'

Redmine::Plugin.register :default_project_members do
  name 'Default Project Members plugin'
  author 'Paul Van de Vreede'
  description 'Select a user or group to become default members on creation of any new Project'
  version '0.0.1'
  url 'https://github.com/pvdvreede/default_project_members'
  author_url 'https://github.com/pvdvreede'
end
