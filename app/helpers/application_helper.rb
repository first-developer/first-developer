module ApplicationHelper

	def time_info time
		time.to_s(:long)
	end

	# 
	def link_to_add_entry
		icon_text = '<i class="icon-plus"></i>'.html_safe
		url = new_entry_path
		classes = 'btn'
		link_to icon_text, url, id: "add_entry_btn", class: classes 
	end

	# Format body text using Markdown
	def markdown(text) 
		options 	= [filter_html: false, no_intra_emphasis: true]
		renderer 	= Redcarpet::Render::HTML.new(*options)
	    extensions 	= {fenced_code: true, autolink: true}
	    markdown 	= Redcarpet::Markdown.new(renderer, extensions)
		markdown.render(text).to_html.html_safe
	end
end
