module DeliveredStoriesReport

  def get_time_of_last_deployment
    unless (app_name = ENV["HEROKU_APP_NAME"]).nil?
      require 'heroku-api'

      heroku  = Heroku::API.new(:api_key => ENV["HEROKU_API_KEY"])
      heroku.get_releases(app_name).body.last['created_at']
    else
      2.day.ago.to_s
    end
  end

  def find_stories date_string, pivotal_api_token
    puts "Date of last deployment: " + date_string
    time_of_last_deployment = DateTime.parse(date_string)
    PivotalTracker::Client.token =  pivotal_api_token
    PivotalTracker::Client.use_ssl = true

    projects = PivotalTracker::Project.all
    new_stories = []

    projects.each do |project|
      puts "Gathering stories for " + project.name
      new_stories += project.stories.all(:state => 'delivered', :modified_since => time_of_last_deployment.to_s)
    end
    new_stories
  end

  def print_stories stories
    puts "\nDelivered stories updated since last deployment"
    stories.each {|story| puts "  " + story.name}
  end

  def email_report stories
    DeliveredPivotalStoriesMailer.delivered_pivotal_stories_mailer(stories).deliver!
  end

end


