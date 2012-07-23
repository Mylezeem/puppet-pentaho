module Puppet::Parser::Functions
  newfunction(:stringify_array, :type => :rvalue) do |args|
	item_array = args[0].join(args[1])
	item_array
  end
end
