class Jobs::DailyDigest

  include Sidekiq::Worker

  def perform person
    DailyDigestHelp.new(person).perform
  end

  private

  class DailyDigestHelp < Struct.new(:person)


    def perform
      DailyDigestMailer.digest(person, stories: stories) if stories.any?
    end

    def stories
      @stories ||= TrackerDailyDigest::Api.stories person.initials
    end


  end


end
