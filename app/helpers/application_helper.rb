module ApplicationHelper
	def parking_options
		Parking.all.map {|v| [v.name, v.id] if v.spots.present? }
	end
end
