worker_processes 1
preload_app true
timeout 30
listen ENV['PORT'] || 3000

stderr_path "/geminabox/log/unicorn_site.stderr.log"
stdout_path "/geminabox/log/unicorn_site.stdout.log"
pid "/geminabox/pids/unicorn.pid"
