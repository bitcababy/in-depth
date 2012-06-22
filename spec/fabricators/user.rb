Fabricator(:user) do
	honorific				{ %W(Mr. Mrs. Ms. Dr.).sample }
	first_name			{ %W(John Jane Jake Dan Larry).sample }
	last_name				{ %W(Black White Orange Red).sample }
end

Fabricator(:teacher, from: :user) do
	unique_name			{ |attrs| "#{attrs[:honorific]} #{Fabricate.sequence} #{attrs[:last_name]}" }
end
