module TrackerDailyDigest
  module Api

    def self.client
      @client ||= TrackerApi::Client.new(token: ENV['TRACKER_TOKEN'])
    end

    def self.memberships
      TrackerApi::Endpoints::Memberships.new(client).get(1047348)
    end

    def self.stories initials
      project.stories(filter:"state:delivered, requester:#{initials}")
    end

    def self.project
      client.project(1047348)
    end


  end
end
