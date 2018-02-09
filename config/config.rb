Sicily.configure do |config|
  config.forbid_mv_to_children_folder = true
  config.notify_when_done = true
  config.num_thread_pool = 50
end

puts "config.rb!"