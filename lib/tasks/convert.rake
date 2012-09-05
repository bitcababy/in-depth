namespace :data do
	task :convert => :environment do
	  Mongoid.unit_of_work(disable: :all) do
			[Occurrence, Teacher, Course, Section, Assignment, SectionAssignment].each do |klass|
				arr = Convert.import_xml_file "#{klass.to_s.tableize}.xml"
				Convert.from_hashes klass, arr
			end
		end
	end
	
end

namespace :update do
	task :assignments => :environment do
		arr = Convert.import_xml_file "updated_assignments.xml", 'updates'
		Convert.from_hashes Assignment, arr
		path = File.join(File.join(Rails.root, 'updates'), 'updated_assignments.xml')
		puts path
	end
end

task :default do
end
