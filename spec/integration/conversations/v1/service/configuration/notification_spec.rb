##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Notification' do
  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .configuration \
                              .notifications().update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Configuration/Notifications',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "log_enabled": true,
          "added_to_conversation": {
              "enabled": false,
              "template": "You have been added to a Conversation: ${CONVERSATION}",
              "sound": "ring"
          },
          "new_message": {
              "enabled": false,
              "template": "You have a new message in ${CONVERSATION} from ${PARTICIPANT}: ${MESSAGE}",
              "badge_count_enabled": true,
              "sound": "ring",
              "with_media": {
                  "enabled": false,
                  "template": "You have a new message in ${CONVERSATION} with ${MEDIA_COUNT} media files: ${MEDIA}"
              }
          },
          "removed_from_conversation": {
              "enabled": false,
              "template": "You have been removed from a Conversation: ${CONVERSATION}",
              "sound": "ring"
          },
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Configuration/Notifications"
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .configuration \
                                     .notifications().update()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .configuration \
                              .notifications().fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Configuration/Notifications',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "log_enabled": false,
          "added_to_conversation": {
              "enabled": true,
              "template": "You have been added to a Conversation: ${CONVERSATION}",
              "sound": "ring"
          },
          "new_message": {
              "enabled": true,
              "template": "You have a new message in ${CONVERSATION} from ${PARTICIPANT}: ${MESSAGE}",
              "badge_count_enabled": false,
              "sound": "ring",
              "with_media": {
                  "enabled": false,
                  "template": "You have a new message in ${CONVERSATION} with ${MEDIA_COUNT} media files: ${MEDIA}"
              }
          },
          "removed_from_conversation": {
              "enabled": true,
              "template": "You have been removed from a Conversation: ${CONVERSATION}",
              "sound": "ring"
          },
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Configuration/Notifications"
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .configuration \
                                     .notifications().fetch()

    expect(actual).to_not eq(nil)
  end
end