require 'test_helper'

class SurveyMailerTest < ActionMailer::TestCase
  test "result" do
    mail = SurveyMailer.result
    assert_equal "Result", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
