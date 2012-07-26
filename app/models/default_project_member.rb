class DefaultProjectMember < ActiveRecord::Base
  unloadable

  attr_accessible :user_id, :role_id
end
