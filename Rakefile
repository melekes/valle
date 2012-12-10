#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'
require 'cucumber/rake/task'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/lib/**/*_test.rb']
  t.verbose = true
end

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.fork = true
  t.cucumber_opts = ['--format', (ENV['CUCUMBER_FORMAT'] || 'progress')]
end

task test_suite: [:test, :cucumber]

task default: :test_suite
