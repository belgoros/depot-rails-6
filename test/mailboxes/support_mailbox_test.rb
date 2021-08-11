require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  test 'we create a SupportRequest when we get a support email' do
    receive_inbound_email_from_mail(
      from: 'chris@somewhere.com',
      to: 'support@example.com',
      subject: 'Need help',
      body: 'I cannot figure out how to check out!!'
    )

    support_request = SupportRequest.last
    assert_equal 'chris@somewhere.com', support_request.email
    assert_equal 'Need help', support_request.subject
    assert_equal 'I cannot figure out how to check out!!', support_request.body
    assert_nil support_request.order
  end
end
