module Guacamole
	module Devise
		class Railtie < Rails::Railtie
			generators do
				require 'guacamole/devise/devise_generator'
			end
		end
	end
end
