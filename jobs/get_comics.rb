require 'rest_client'
require 'digest/md5'

SCHEDULER.every '1h', :first_in => 0 do |job|
  timestamp = Time.now.to_s.gsub(/\s+/, "")
  hash = Digest::MD5.hexdigest(timestamp + settings.marvel_private_key.to_s + settings.marvel_public_key.to_s)

  returned_data = RestClient::Request.new(
    :method => :get,
    :url => 'http://gateway.marvel.com:80/v1/public/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key.to_s + '&hash=' + hash + '&format=comic&dateDescriptor=thisWeek'
  ).execute

  parsed_data = JSON.parse(returned_data)
  results = parsed_data['data']['results']

  send_event('issue_big_picture', image: results[0]['images'].first['path'] + '.jpg')
  send_event('issue_title', title: timestamp)
  send_event('issue_description', text: hash)
end
