module Puppet::Parser::Functions
  newfunction(:pentaho_dirname, :type => :rvalue) do |args|
	File.dirname(args[0])
  end
end
