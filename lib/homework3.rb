# frozen_string_literal: true

require 'homework3/version'

module Homework3
  Dir[File.expand_path('homework3/**/*.rb', __dir__)].each { |f| require f }

  # Instead of using Open Class technique (e.g. class String; ... end)
  # we include additional functionality into core classes implicitly
  String.include CoreExtensions::EnumerableFriendlyString
  Array.include CoreExtensions::InjectableArray
end
