module TrackerDailyDigest
  module Api

    SUPPORT="1062572"
    GENERAL="1255296"
    WEBAPP="1047348"
    HORSE="1239932"
    INTEGRATIONS="1239852"

    PROJECTS = [ SUPPORT, GENERAL, WEBAPP, HORSE, INTEGRATIONS ].freeze

    def self.client
      @client ||= TrackerApi::Client.new(token: ENV['TRACKER_TOKEN'])
    end

    def self.memberships
      TrackerApi::Endpoints::Memberships.new(client).get(GENERAL)
    end

    def self.stories initials
      PROJECTS.flat_map{ |project| client.project(project).stories(filter:"state:delivered, requester:#{initials}") }
    end

  end
end
