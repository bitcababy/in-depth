require 'spec_helper'

describe Assignment do
	it { should validate_presence_of(:name) }
end
