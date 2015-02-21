require 'rest_client'
require 'digest/md5'
require 'pry'
require 'dotenv'

Dotenv.load

def get_asm_data_from_marvel_api
  timestamp = Time.now.to_s.gsub(/\s+/, "")
  hash = Digest::MD5.hexdigest(timestamp + ENV['MARVEL_PRIVATE_KEY'] + ENV['MARVEL_PUBLIC_KEY'])

  returned_data = RestClient::Request.new(
    :method => :get,
    :url => 'http://gateway.marvel.com/v1/public/series/1987/comics?ts=' + timestamp + '&apikey=' + ENV['MARVEL_PUBLIC_KEY'] + '&hash=' + hash + '&limit=100&formatType=comic&noVariants=true&orderBy=issueNumber'
  ).execute

  parsed_data = JSON.parse(returned_data)
  return parsed_data['data']['results']
end

def send_asm_data_to_dashboard(asm_data)
  creators_string = ""
  creators_array = []

  asm_data.first["creators"]["items"].each do |i|
    creators_array << i.select{ |k,v| k != 'resourceURI' }
  end

  creators_array.map!{ |i| i.values.join(": ") }
  creators_string = creators_array.join(", ")

  sale_date = DateTime.parse(asm_data.first["dates"].first["date"]).to_date
  formatted_sale_date = sale_date.strftime("%B %d, %Y")

  send_event('asm_big_picture', image: asm_data.first['images'].empty? ? 'http://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png' : asm_data.first['images'].first['path'] + '.jpg')
  send_event('asm_title', text: asm_data.first['title'])
  send_event('asm_description', text: asm_data.first["description"].to_s)
  send_event('asm_creators', text: creators_string)
  send_event('asm_sale_date', text: formatted_sale_date)
  send_event('asm_sale_price', text: "$" + asm_data.first["prices"].first["price"].to_s)

  asm_data.rotate!
end

SCHEDULER.every '1d', :first_in => 0 do |job|
  asm_data = get_asm_data_from_marvel_api
  send_asm_data_to_dashboard(asm_data)

  SCHEDULER.every '7s', :first_in => 0 do |job|
    send_asm_data_to_dashboard(asm_data)
  end
end
