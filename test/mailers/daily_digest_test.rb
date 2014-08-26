require 'test_helper'

class DailyDigestTest < ActionMailer::TestCase
  test "digest" do
    mail = DailyDigest.digest
    assert_equal "Digest", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
