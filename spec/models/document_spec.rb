require 'spec_helper'

describe Document do
	it { should belong_to(:owner) }
	
	# context "versioning" do
	# 	describe 'bump_minor_version' do
	# 		doc = Fabricate :document
	# 		it "can bump its minor version" do
	# 			expect {
	# 				doc.bump_minor_version
	# 			}.to change{ doc.minor_version }.by(1)
	# 		end
	# 	end
	# 
	# 	describe 'bump_major_version' do
	# 		doc = Fabricate :document
	# 		it "can bump its major version" do
	# 			expect {
	# 				doc.bump_major_version
	# 			}.to change{ doc.major_version }.by(1)
	# 		end
	# 	end
	# end

end
