task :import => :environment do
	Bridge.create_or_update_assignments
	Bridge.create_or_update_sas
	Bridge.update_courses
	Bridge.delete_sas
	Bridge.delete_assignments
end
