# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
set :chronic_options, hours24: true
set :environment, ENV['RAILS_ENV']
set :bundle_command, 'bundle exec'
job_type :runner, "cd :path && :bundle_command rails runner -e :environment ':task' :output"
set :output, "#{path}/log/cron_log.log"
#
every 1.day do
  runner "AwsAmazonCloud.create_or_build", :environment => environment
end
