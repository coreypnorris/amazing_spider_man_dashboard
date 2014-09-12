require 'rest_client'
require_relative 'get_comics.rb'

SCHEDULER.every '7s', :first_in => 0 do |job|
  sleep(5)
  results = $results.rotate!
  send_event('issue_big_picture', image: results[0]['images'].first['path'] + '.jpg')
  send_event('issue_title', title: results[0]['title'])
  send_event('issue_description', text: results[0]['description'])
  send_event('preview_thumbnail_1', image: results[1]['thumbnail'].first.last + '.jpg')
  send_event('preview_thumbnail_2', image: results[2]['thumbnail'].first.last + '.jpg')
  send_event('preview_thumbnail_3', image: results[3]['thumbnail'].first.last + '.jpg')
  send_event('preview_thumbnail_4', image: results[4]['thumbnail'].first.last + '.jpg')
end
