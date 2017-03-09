require 'logger'
require 'open-uri'
require 'json'

module Tagenv
  module Ec2
    class Metadata
      def self.get_metadata(path)
        begin
          result = {}
          ::Timeout.timeout(TIME_OUT) {
            body = open('http://169.254.169.254' + path).read
            return body
          }
          return result
        rescue Timeout::Error => e
          raise "not EC2 instance"
        end
      end

      def self.get_document
        JSON.parse(get_metadata('/latest/dynamic/instance-identity/document/'))
      end

      def self.get_instance_id
        get_metadata('/latest/meta-data/instance-id')
      end
    end
  end
end
