#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

require File.expand_path('../config/application', __FILE__)

Hungrypotamus::Application.load_tasks

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

desc "Run all of the tests"
task :default => [:spec, :features]
