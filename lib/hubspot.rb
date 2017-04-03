require "hubspot/version"
require "hubspot/error"
require "hubspot/connection"
require "hubspot/contact"
require 'hubspot/config'

module Hubspot
  extend self

  def configure
    yield(Config) if block_given?
  end
end
