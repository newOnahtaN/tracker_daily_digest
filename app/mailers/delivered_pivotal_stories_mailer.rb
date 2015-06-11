class DeliveredPivotalStoriesMailer < ActionMailer::Base
  default from: "no-reply@viewthespace.com"

  def delivered_pivotal_stories_mailer new_stories
    @new_stories = new_stories
    unless (email_recipient = ENV["EMAIL_RECIPIENT"]).nil?
      mail(to: email_recipient , subject: 'Updates Since Last Deployment')
    else
      mail(to: 'nathan.owen@viewthespace.com' , subject: 'Updates Since Last Deployment')
    end
  end
end
