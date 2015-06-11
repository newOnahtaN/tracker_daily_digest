task :email_delivered_stories => :environment do
  require 'deployment_email/delivered_stories_report'
  include DeliveredStoriesReport
  puts "Finding Delivered Stories"
  stories = find_stories get_time_of_last_deployment, get_pivotal_api_token
  print_stories stories
  puts "Sending Email"
  email_report stories
  puts "Done"
end