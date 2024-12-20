# *******************************
# lemonway_ruby - Loading modules and configurations for the LemonwayRuby gem.
#
# This file is responsible for loading all the necessary Ruby modules for the correct functioning of the
# `LemonwayRuby` gem. It includes the configuration and client to interact with the Lemonway services.
#
# 1. The `active_support/core_ext/hash/indifferent_access` library is imported to allow hash access with 
#    both symbols and strings interchangeably.
#
# 2. The `helpers.rb` file is loaded, containing helper methods used by other parts of the gem.
#
# 3. The following section dynamically loads all Ruby modules and classes from the `lemonway_ruby` directory,
#    including subdirectories, to avoid having to manually write a `require` statement for each file.
#
# 4. The `LemonwayRuby` module is configured, including the necessary configuration and client modules to interact 
#    with the Lemonway API.
#
# Make sure to update this section with additional details in case of significant changes to the flow or structure 
# of the project.
# *******************************



require "active_support/core_ext/hash/indifferent_access"
require_relative 'lemonway_ruby/helpers'


Dir[File.join(__dir__, 'lemonway_ruby', '**', '*.rb')].sort.each { |file| require file }



module LemonwayRuby
  class << self
    include Configuration
    include Client
  end
end