# runs delete_items rake task every 1 minute

set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.minute do
  rake "todo:delete_items"
end
