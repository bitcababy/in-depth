class User
	include Mongoid::Document
	
	field :h, as: :honorific, type:String
	field :fn, as: :first_name, type: String
	field :ln, as: :last_name, type: String
	field :un, as: :unique_name, type: String
	
end
