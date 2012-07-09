require 'pp'

module Puppet::Parser::Functions
  newfunction(:get_cwd_hash_path, :type => :rvalue) do |args|


	#
	# Take the pentaho-solutions path as inputs with the supposed-to-be
	# pentaho_solution folder as basename.
	# 
	# Split the dirname by / and make sure to create all the parents folder
	# equivalent of mkdir -p on *nix machine.
	#
	#
	# The catalog lookup is here to make sure we do not define a path twice
	#
	  

    folder_array = File.dirname(args[0]).slice(1, args[0].length).split("/")
    cpath = '/'
    fs = Hash.new()
    folder_array.each do |x|
      cpath += x +  '/'
      #fs[cpath] = Hash['name' => cpath, 'owner' => 'root', 'group' => 'root', 'mode' => '0755', 'ensure' => 'directory'] unless compiler.catalog.resource_keys.include?(["File", cpath])
      fs[cpath] = {} unless compiler.catalog.resource_keys.include?(["File", cpath])
    end
	fs
  end
end
