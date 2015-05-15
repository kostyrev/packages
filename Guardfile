  guard :foodcritic, :cookbook_paths => '.', :cli => '-t ~FC023 -t ~FC005', :all_on_start => false do
    watch(%r{attributes/.+\.rb$})
    watch(%r{providers/.+\.rb$})
    watch(%r{recipes/.+\.rb$})
    watch(%r{resources/.+\.rb$})
    watch(%r{definitions/.+\.rb$})
  end

