module Puppet::Parser::Functions
  newfunction(:append_instance_name, :type => :rvalue) do |args|
	  item_hash = args[0]
	  newH = Hash.new()
	  item_hash.each_key  do |x|
			newH[x + args[1]] = {}	
	  end
	  newH
  end
end
