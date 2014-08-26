class Jobs::DailyDigest

  include Sidekiq::Worker

  def perform person
    DailyDigestMailer.digest(person, stories: stories(person)).deliver
  end

  private

  def stories person
    TrackerDailyDigest::Api.stories person.initials
  end


end
