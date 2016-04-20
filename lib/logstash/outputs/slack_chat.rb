# encoding: utf-8
require "logstash/outputs/base"
require "logstash/namespace"
require 'manticore'

# An example output that does nothing.
class LogStash::Outputs::SlackChat< LogStash::Outputs::Base
  config_name "slack_chat"

	config :url, :validate => :string, :required => :true
	config :token, :validate => :string, :required => :true
	config :channel, :validate => :string, :required => :true

  public
  def register
  end # def register

  public
  def receive(event)
		client = Manticore::Client.new
		client.get(@url, params: {token:@token, channel:@channel, text:event['message']}).body
    return "Event received"
  end # def event
end # class LogStash::Outputs::SlackChat
