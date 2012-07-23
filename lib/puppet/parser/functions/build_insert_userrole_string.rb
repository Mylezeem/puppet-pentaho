require 'pp'

module Puppet::Parser::Functions
  newfunction(:build_insert_userrole_string, :type => :rvalue) do |args|
	  init_array = args[0]
	  ignore = ""
	  ignore = "IGNORE" if  args[2][0 .. 4].eql?("mysql")
	  pp init_array
	  init_array.map!  do |x|
		  args[2] + " hibernate" + args[3] + " " + args[4] + " \"INSERT " + ignore + " INTO GRANTED_AUTHORITIES VALUES (\'" + args[1] + "\', \'" + x + "\')\""
	  end
	  pp init_array
	  init_array
  end
end
