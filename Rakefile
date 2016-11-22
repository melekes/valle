#!/usr/bin/env rake
require 'rubygems'
require 'bundler'
require 'rake'
require 'appraisal'
require 'rake/testtask'
require 'cucumber/rake/task'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/lib/**/*_test.rb']
  t.verbose = true
end

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = ['--format', (ENV['CUCUMBER_FORMAT'] || 'progress')]
end

task test_suite: [:test, :cucumber]

if !ENV['APPRAISAL_INITIALIZED'] && !ENV['TRAVIS']
  task :default => :appraisal
else
  task default: :test_suite
end
