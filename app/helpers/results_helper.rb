module ResultsHelper
	def image_name_to_css(image_name)
		return "background-image: url(https://s3-eu-west-1.amazonaws.com/sterknetwerk/report/" + image_name + ")"
	end

	def number_to_euro(number)
		number_to_currency(number, :unit => "&euro;", :precision => 0, :delimiter => "&thinsp;")
	end
	
end