#
# [0 .. args[0].length - args[1].length - 1]
#
# Transforms output from append_instance_name ie. yguenaneinstance01
# to the object we want ie. yguenane (if instance name == instance01)
#
#
module Puppet::Parser::Functions
  newfunction(:remove_instance_name, :type => :rvalue) do |args|
	  user = args[0][0 .. args[0].length - args[1].length - 1]
	  user
  end
end
