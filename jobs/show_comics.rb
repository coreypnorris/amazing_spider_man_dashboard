require 'rest_client'
require_relative 'get_comics.rb'

SCHEDULER.every '5s', :first_in => '10s' do |job|
  rotated_results = $results.rotate!
  send_event('twc_issue_big_picture', image: rotated_results[0]['images'].first['path'] + '.jpg')
  send_event('twc_issue_title', title: rotated_results[0]['title'])
  send_event('twc_issue_description', text: rotated_results[0]['description'])
  send_event('twc_preview_thumbnail_1', image: rotated_results[1]['thumbnail'].first.last + '.jpg')
  send_event('twc_preview_thumbnail_2', image: rotated_results[2]['thumbnail'].first.last + '.jpg')
  send_event('twc_preview_thumbnail_3', image: rotated_results[3]['thumbnail'].first.last + '.jpg')
  send_event('twc_preview_thumbnail_4', image: rotated_results[4]['thumbnail'].first.last + '.jpg')
end

SCHEDULER.every '20s', :first_in => '10s' do |job|
  rotated_results = $amazing_spider_man_results.rotate!

  creators_string = ""

  rotated_results[0]["creators"]["items"].each do |item|
    creators_string += item["name"] + " " + item["role"]
    if item == rotated_results[0]["creators"]["items"].last
      creators_string += "."
    else
      creators_string += ", "
    end
  end

  sale_date = DateTime.parse(rotated_results[0]["dates"][0]["date"]).to_date
  formatted_sale_date = sale_date.strftime("%B %d, %Y")

  send_event('asm_issue_big_picture', image: rotated_results[0]['images'].first['path'] + '.jpg')
  send_event('asm_issue_description', title: rotated_results[0]['title'])
  send_event('asm_issue_description', text: rotated_results[0]['description'])
  send_event('asm_creators', text: creators_string)
  send_event('asm_sale_date', text: formatted_sale_date)
  send_event('asm_sale_price', text: rotated_results[0]["prices"][0]["price"].to_s)
  # send_event('asm_preview_thumbnail_3', text: rotated_results[0])
  # send_event('asm_preview_thumbnail_4', text: rotated_results[0])
end
