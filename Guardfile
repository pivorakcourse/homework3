# frozen_string_literal: true

guard :rspec, cmd: 'rspec spec' do
  watch(%r{^spec/(.*)\/?(.*)_spec\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$}) { |m| "spec/#{ m[1] }#{ m[2] }_spec.rb" }
  watch('spec/spec_helper.rb')       { 'spec' }
end

guard :rubocop do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
