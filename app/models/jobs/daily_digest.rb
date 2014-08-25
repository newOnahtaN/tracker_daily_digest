class Jobs::DailyDigest

  include Sidekiq::Worker

  def perform person

  end


end
