web: bundle exec puma -p $PORT
resque: TERM_CHILD=1 QUEUES=* rake resque:work