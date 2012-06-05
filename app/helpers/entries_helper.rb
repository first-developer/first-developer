module EntriesHelper

	def formated_body (body)
		RedCloth.new(body).to_html
	end

end
