module ApplicationHelper

	def time_info time
		time.to_s(:long)
	end

	# 
	def link_to_add_entry
		icon_text = '<i class="icon-plus"></i>'.html_safe
		url = new_entry_path
		classes = 'btn'
		link_to icon_text, url, class: classes 
	end
end
