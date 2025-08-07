namespace :sidekiq do
  desc "Start Sidekiq"
  task :start do
    # This command will run after the entrypoint has set everything up.
    exec("bundle", "exec", "sidekiq", "-e", "production", "-q", "default", "-q", "mailers")
  end
end
