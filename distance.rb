locations = [
  [-15.605215, -56.064810],
  [-15.610501, -56.071836],
  [-15.611381, -56.077234],
  [-9.912149, -63.038292],
  [-31.741557, -52.338302]
]

def distance (start_location, end_location)
  earth_rad = 6371 # Earth rad in km
  degree_rad = Math::PI/180

  dlat = (end_location[0] - start_location[0]) * degree_rad
  dlon = (end_location[1] - start_location[1]) * degree_rad

  a = (Math.sin(dlat / 2))**2 + Math.cos(start_location[0] * degree_rad) *  Math.cos(end_location[0] * degree_rad) * (Math.sin(dlon / 2))**2  
  c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

  (c * earth_rad).round(2)
end

locations.each_with_index do |start_point, start_index|  
  puts "\nFrom #{start_point} to:"
  locations.each_with_index do  |end_point, end_index|
    if start_index != end_index 
      puts "#{end_point}:  #{distance(start_point, end_point)} km"
    end
  end
end