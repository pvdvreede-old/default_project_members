# patch Project model so that it will add a user or group as members on creation

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
			member = Member.new( :role_ids => [3], :user_id => 1, :project_id => self.id )			
			if not member.save
				raise "member didnt save #{self.id} #{self.subject} #{self.members}"
			end
			self.members << member
		end
	end
end

Project.send(:include, ProjectPatch)