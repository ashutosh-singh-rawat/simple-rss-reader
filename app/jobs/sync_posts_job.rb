class SyncPostsJob < ApplicationJob
  #SyncPostsJob.perform_later
  queue_as :default

  def perform(*args)
    RssMango::Application.load_tasks
    Rake::Task["feeds:sync_posts"].invoke
  end
end
