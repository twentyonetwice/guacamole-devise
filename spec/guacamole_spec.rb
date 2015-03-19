# -*- encoding : utf-8 -*-

require 'spec_helper'

if !defined?(Guacamole) || !(Guacamole.configuration.database.create rescue Ashikawa::Core::ClientError)
	puts "** require 'guacamole' and start ArangoDB to run the specs in #{__FILE__}"
else

	# Pure guacamole related specs!
	describe 'The collections' do

		let(:new_user) { User.new(name: 'Lou', rating: 99) }

		it 'should create a user in the database' do
			UsersCollection.save new_user

			expect(UsersCollection.by_key(new_user.key)).to eq new_user
		end
	end

end
