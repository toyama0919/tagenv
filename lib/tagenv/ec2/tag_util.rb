require 'aws-sdk'

module Tagenv
  module Ec2
    class TagUtil
      def self.convert_tag_hash(prefix, tags)
        result = {}
        tags.each {|hash|
          result[prefix + (hash['key'] || hash[:key])] = hash['value'] || hash[:value]
        }
        result
      end
    end
  end
end
