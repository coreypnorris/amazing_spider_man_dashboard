require 'rest_client'
require 'digest/md5'

SCHEDULER.every '1h', :first_in => 0 do |job|
  timestamp = Time.now.to_s.gsub(/\s+/, "")
  hash = Digest::MD5.hexdigest(timestamp + settings.marvel_private_key + settings.marvel_public_key)

  returned_data = RestClient::Request.new(
    :method => :get,
    :url => 'http://gateway.marvel.com:80/v1/public/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key + '&hash=' + hash + '&format=comic&dateDescriptor=thisWeek'
  ).execute

  parsed_data = JSON.parse(returned_data)
  $results = parsed_data['data']['results']
end

SCHEDULER.every '1h', :first_in => 0 do |job|
  timestamp = Time.now.to_s.gsub(/\s+/, "")
  hash = Digest::MD5.hexdigest(timestamp + settings.marvel_private_key + settings.marvel_public_key)

  returned_data = RestClient::Request.new(
    :method => :get,
    :url => 'http://gateway.marvel.com:80/v1/public/series/1987/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key + '&hash=' + hash + '&formatType=comic&noVariants=true&orderBy=issueNumber'
  ).execute

  parsed_data = JSON.parse(returned_data)
  $amazing_spider_man_results = parsed_data['data']['results']
end
