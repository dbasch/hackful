module ApplicationHelper	
	def comment_count(object)
		count = object.comments.count
		object.comments.each do |comment|
			count += comment_count(comment)
		end
		count
	end
	
	def markdown(text, *options)
		require 'rdiscount'

		text = sanitize(text) unless text.html_safe? || options.delete(:safe)
		(text.blank? ? "" : RDiscount.new(text, :filter_html ).to_html).html_safe
	end
end
