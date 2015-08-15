namespace :update2016 do
  task :sections => :environment do
    require Rails.root.join('import/convert')
    Section.where(year: 2016).delete_all
    arr = Convert.import_xml_file "sections2016.xml"
    Convert.from_hashes Section, arr, false
  end
end

