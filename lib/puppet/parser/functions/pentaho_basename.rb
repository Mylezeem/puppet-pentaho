module Puppet::Parser::Functions
  newfunction(:pentaho_basename, :type => :rvalue) do |args|
	File.basename(args[0])
  end
end
