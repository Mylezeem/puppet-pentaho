require 'base64'

module Puppet::Parser::Functions
  newfunction(:pentaho_base64, :type => :rvalue) do |args|
	Base64.encode64(args[0]).chomp
  end
end
