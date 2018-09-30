require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "download_pdf" do
    mail = OrderMailer.download_pdf
    assert_equal "Download pdf", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
