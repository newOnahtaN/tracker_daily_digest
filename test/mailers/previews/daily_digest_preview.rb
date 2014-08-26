# Preview all emails at http://localhost:3000/rails/mailers/daily_digest
class DailyDigestPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/daily_digest/digest
  def digest
    person = TrackerDailyDigest::Api.memberships.detect{|m| m.person.initials == "KB" }.person
    stories = TrackerDailyDigest::Api.stories('KB')
    DailyDigestMailer.digest(person, stories: stories)
  end


end
