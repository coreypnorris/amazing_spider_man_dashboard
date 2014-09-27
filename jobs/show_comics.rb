require 'rest_client'
require_relative 'get_comics.rb'


# Weekly comics dashboard
SCHEDULER.every '5s', :first_in => '1m' do |job|
  send_event('twc_big_picture', image: $weekly_comics_results.first['images'].first['path'] + '.jpg')
  send_event('twc_title', title: $weekly_comics_results.first['title'])
  send_event('twc_description', text: $weekly_comics_results.first['description'])
  send_event('twc_preview_thumbnail_1', image: $weekly_comics_results[1]['thumbnail'].first.last + '.jpg')
  send_event('twc_preview_thumbnail_2', image: $weekly_comics_results[2]['thumbnail'].first.last + '.jpg')
  send_event('twc_preview_thumbnail_3', image: $weekly_comics_results[3]['thumbnail'].first.last + '.jpg')
  send_event('twc_preview_thumbnail_4', image: $weekly_comics_results[4]['thumbnail'].first.last + '.jpg')

  $weekly_comics_results.rotate!
end

# Amazing Spider-Man dashboard
SCHEDULER.every '20s', :first_in => '2m' do |job|
  creators_string = ""
  creators_array = []

  $asm_results.first["creators"]["items"].each do |i|
    creators_array << i.select{ |k,v| k != 'resourceURI' }
  end

  creators_array.map!{ |i| i.values.join(": ") }
  creators_string = creators_array.join(", ")

  sale_date = DateTime.parse($asm_results.first["dates"].first["date"]).to_date
  formatted_sale_date = sale_date.strftime("%B %d, %Y")

  send_event('asm_big_picture', image: $asm_results.first['images'].first['path'] + '.jpg')
  send_event('asm_title', text: $asm_results.first['title'])
  send_event('asm_description', text: $asm_results.first["description"].to_s)
  send_event('asm_creators', text: creators_string)
  send_event('asm_sale_date', text: formatted_sale_date)
  send_event('asm_sale_price', text: "$" + $asm_results.first["prices"].first["price"].to_s)

  $asm_results.rotate!
end

# Captain America dashboard
SCHEDULER.every '20s', :first_in => '3m' do |job|
  creators_string = ""
  creators_array = []

  $cap_results.first["creators"]["items"].each do |i|
    creators_array << i.select{ |k,v| k != 'resourceURI' }
  end

  creators_array.map!{ |i| i.values.join(": ") }
  creators_string = creators_array.join(", ")

  sale_date = DateTime.parse($cap_results.first["dates"].first["date"]).to_date
  formatted_sale_date = sale_date.strftime("%B %d, %Y")

  send_event('cap_big_picture', image: $cap_results.first['images'].first['path'] + '.jpg')
  send_event('cap_title', text: $cap_results.first['title'])
  send_event('cap_description', text: $cap_results.first["description"].to_s)
  send_event('cap_creators', text: creators_string)
  send_event('cap_sale_date', text: formatted_sale_date)
  send_event('cap_sale_price', text: "$" + $cap_results.first["prices"].first["price"].to_s)

  $cap_results.rotate!
end
