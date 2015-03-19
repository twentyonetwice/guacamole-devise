require 'bundler/gem_tasks'

desc 'Start a REPL with guacamole loaded (not the Rails part)'
task :console do
	require 'bundler/setup'
	require 'pry'
	require 'guacamole'
	ARGV.clear
	Pry.start
end
