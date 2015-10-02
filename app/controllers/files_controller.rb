class FilesController < ApplicationController
	REDIRECT_URL = 'http://files.westonmath.org'

	def pass_on
		redirect_to "#{REDIRECT_URL}#{request.path}"
  end

end
