class CreateDefaultProjectMembers < ActiveRecord::Migration
  def change
    create_table :default_project_members do |t|
      t.integer :role_id
      t.integer :user_id
    end
  end
end
