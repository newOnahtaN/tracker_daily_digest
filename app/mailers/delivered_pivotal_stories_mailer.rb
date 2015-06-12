class DeliveredPivotalStoriesMailer < ActionMailer::Base
  default from: "no-reply@viewthespace.com"

  def delivered_pivotal_stories_mailer new_stories, date_string
    attachments.inline['bug'] = File.read('app/assets/images/bug.png')
    attachments.inline['chore'] = File.read('app/assets/images/chore.png')
    attachments.inline['feature'] = File.read('app/assets/images/feature.png')
    attachments.inline['release'] = File.read('app/assets/images/release.png')
    @new_stories = new_stories
    @time_of_last_deployment = DateTime.parse(date_string)
    unless (email_recipient = ENV["EMAIL_RECIPIENT"]).nil?
      mail(to: email_recipient , subject: 'Updates Since Last Deployment')
    else
      mail(to: 'nathan.owen@viewthespace.com' , subject: 'Updates Since Last Deployment')
    end
  end
end
