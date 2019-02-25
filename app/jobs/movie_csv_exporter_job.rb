class MovieCsvExporterJob < ApplicationJob
  queue_as :default

  def perform(user_id, path=nil)
    MovieExporter.new.call(User.find(user_id), path)
  end
end
