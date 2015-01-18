# require 'rest_client'
# require 'digest/md5'
#
# SCHEDULER.every '1h', :first_in => 0 do |job|
#   timestamp = Time.now.to_s.gsub(/\s+/, "")
#   hash = Digest::MD5.hexdigest(timestamp + settings.marvel_private_key + settings.marvel_public_key)
#
#   # Get this weeks comics
#   returned_data = RestClient::Request.new(
#     :method => :get,
#     :url => 'http://gateway.marvel.com:80/v1/public/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key + '&hash=' + hash + '&format=comic&dateDescriptor=thisWeek'
#   ).execute
#
#   parsed_data = JSON.parse(returned_data)
#   $weekly_comics_results = parsed_data['data']['results']
#
#   # Get Amazing Spider-Man issues
#   returned_data = RestClient::Request.new(
#     :method => :get,
#     :url => 'http://gateway.marvel.com:80/v1/public/series/1987/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key + '&hash=' + hash + '&limit=100&formatType=comic&noVariants=true&orderBy=issueNumber'
#   ).execute
#
#   parsed_data = JSON.parse(returned_data)
#   $asm_results = parsed_data['data']['results']
#
#   # Get Captain America issues
#   returned_data = RestClient::Request.new(
#     :method => :get,
#     :url => 'http://gateway.marvel.com:80/v1/public/series/1996/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key + '&hash=' + hash + '&limit=100&formatType=comic&noVariants=true&orderBy=issueNumber'
#   ).execute
#
#   parsed_data = JSON.parse(returned_data)
#   $cap_results = parsed_data['data']['results']
#
#   # Get Thor issues
#   returned_data = RestClient::Request.new(
#     :method => :get,
#     :url => 'http://gateway.marvel.com:80/v1/public/series/2083/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key + '&hash=' + hash + '&limit=100&formatType=comic&noVariants=true&orderBy=issueNumber'
#   ).execute
#
#   parsed_data = JSON.parse(returned_data)
#   $thor_results = parsed_data['data']['results']
#
#   # Get Iron Man issues
#   returned_data = RestClient::Request.new(
#     :method => :get,
#     :url => 'http://gateway.marvel.com:80/v1/public/series/2029/comics?ts=' + timestamp + '&apikey=' + settings.marvel_public_key + '&hash=' + hash + '&limit=100&formatType=comic&noVariants=true&orderBy=issueNumber'
#   ).execute
#
#   parsed_data = JSON.parse(returned_data)
#   $iron_man_results = parsed_data['data']['results']
# end
