class ApplicationController < ActionController::Base
  protect_from_forgery
  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at]
  end
end
