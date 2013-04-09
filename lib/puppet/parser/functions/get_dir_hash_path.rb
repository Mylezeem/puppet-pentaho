module Puppet::Parser::Functions

	newfunction(:get_dir_hash_path, :type => :rvalue) do |args|

		folder_array = args[0].slice(1, args[0].length).split("/")
		cpath = '/'
		fs = Hash.new()
		folder_array.each do |x|
			cpath += x + '/'
			fs[cpath] = {} unless compiler.catalog.resource_keys.include?(["File", cpath])
		end
		fs

	end

end
