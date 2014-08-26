class DailyDigestMailer < ActionMailer::Base
  default from: "no-reply@viewthespace.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_digest.digest.subject
  #
  def digest(person, stories:)
    @stories = stories
    @person = person

    mail to: person.email,
      subject: "Pivotal Tracker items waiting on you to Accept or Reject"

  end


end
