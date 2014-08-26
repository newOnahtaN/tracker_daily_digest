class Jobs::DailyDigests

  include Sidekiq::Worker


  def perform
    memberships.each do |membership|
      Jobs::DailyDigest.perform_async(membership.person) if stories?(person)
    end
  end

  private

  def stories?(person)
    TrackerDailyDigest::Api.stories(person.initials).any?
  end

  def memberships
    TrackerDailyDigest::Api.memberships
  end


end
