require 'rest_client'
require_relative 'get_comics.rb'

SCHEDULER.every '5s', :first_in => '10s' do |job|
  rotated_results = $results.rotate!
  send_event('issue_big_picture', image: rotated_results[0]['images'].first['path'] + '.jpg')
  send_event('issue_title', title: rotated_results[0]['title'])
  send_event('issue_description', text: rotated_results[0]['description'])
  send_event('preview_thumbnail_1', image: rotated_results[1]['thumbnail'].first.last + '.jpg')
  send_event('preview_thumbnail_2', image: rotated_results[2]['thumbnail'].first.last + '.jpg')
  send_event('preview_thumbnail_3', image: rotated_results[3]['thumbnail'].first.last + '.jpg')
  send_event('preview_thumbnail_4', image: rotated_results[4]['thumbnail'].first.last + '.jpg')
end
