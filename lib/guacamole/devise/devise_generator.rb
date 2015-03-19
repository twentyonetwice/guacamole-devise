require 'generators/devise/orm_helpers'

module Guacamole
	module Devise
		class DeviseGenerator < Rails::Generators::NamedBase
			include ::Devise::Generators::OrmHelpers

			namespace 'guacamole:devise'

			def generate_model
				invoke 'guacamole:model', [name] unless model_exists? && behavior == :invoke
			end

			def inject_field_types
				inject_into_file model_path, model_attributes, after: "include Guacamole::Model\n" if model_exists?
			end

			def inject_devise_content
				content = "\n  extend ActiveSupport::Concern\n  extend Devise::Models::Authenticatable\n"
				content << "\n  devise :database_authenticatable, :registerable\n"
				inject_into_file model_path, content, after: "include Guacamole::Model\n" if model_exists?
			end
			
			
			def model_attributes 
<<RUBY
	## Database authenticatable
	attribute :email, String, :default => ''
	attribute :encrypted_password, String, :default => ''

	## Recoverable
	#attribute :reset_password_token, String
	#attribute :reset_password_sent_at, Time

	## Rememberable
	#attribute :remember_created_at, Time

	## Trackable
	#attribute :sign_in_count, Integer, :default => 0
	#attribute :current_sign_in_at, Time
	#attribute :last_sign_in_at, Time
	#attribute :current_sign_in_ip, String
	#attribute :last_sign_in_ip, String

	## Confirmable
	# attribute :confirmation_token, String
	# attribute :confirmed_at, Time
	# attribute :confirmation_sent_at, Time
	# attribute :unconfirmed_email, String # Only if using reconfirmable

	## Lockable
	# attribute :failed_attempts, Integer, :default => 0 # Only if lock strategy is :failed_attempts
	# attribute :unlock_token, String # Only if unlock strategy is :email or :both
	# attribute :locked_at, Time
RUBY
			end

		end
	end
end
