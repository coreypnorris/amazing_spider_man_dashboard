require 'rest_client'
require 'digest/md5'

SCHEDULER.every '1h', :first_in => 0 do |job|
  timestamp = Time.now.to_s.gsub(/\s+/, "")
  hash = Digest::MD5.hexdigest(timestamp + ENV['MARVEL_PRIVATE_KEY'] + ENV['MARVEL_PUBLIC_KEY'])

  returned_data = RestClient::Request.new(
    :method => :get,
    :url => 'http://gateway.marvel.com:80/v1/public/comics?ts=' + timestamp + '&apikey=' + ENV['MARVEL_PUBLIC_KEY'] + '&hash=' + hash + '&format=comic&dateDescriptor=thisWeek'
  ).execute

  parsed_data = JSON.parse(returned_data)
  $results = parsed_data['data']['results']
end
