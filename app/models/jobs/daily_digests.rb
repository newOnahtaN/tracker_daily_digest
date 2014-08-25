class Jobs::DailyDigests

  include Sidekiq::Worker


  def perform
    memberships.each do |membership|
      Jobs::DailyDigest.perform_async membership.person
    end
  end

  private

  def memberships
    TrackerDailyDigest::Api.memberships
  end


end
