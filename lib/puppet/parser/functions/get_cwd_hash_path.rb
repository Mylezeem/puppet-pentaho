module Puppet::Parser::Functions
  newfunction(:get_cwd_hash_path, :type => :rvalue) do |args|

    folder_array = args[0].split("/")
    cpath = ''
    fs = Hash.new()
    folder_array.each do |x|
      cpath += x +  '/'
      fs[cpath + args[1]] = Hash['name' => cpath, 'owner' => 'root', 'group' => 'root', 'mode' => '0755', 'ensure' => 'directory']
    end
	fs
  end
end
