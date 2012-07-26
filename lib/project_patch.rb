# patch Project model so that it will add a user or group as members on creation

module DefaultProjectMembers
  module ProjectPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do 
        unloadable

        # add filter for after a project is created
        after_create :add_default_members_to_project
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      # filter method to add a member to the project after saving it
      def add_default_members_to_project
        default_members = DefaultProjectMember.all
        default_members.each do |m|
          member = Member.new( :role_ids => [m.role_id], :user_id => m.user_id, :project_id => self.id )			
          self.members << member
        end
      end
    end
  end
end

Project.send(:include, DefaultProjectMembers::ProjectPatch)