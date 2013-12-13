$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rspec'
require 'prct09/racional.rb'
require 'prct09/matriz.rb'
require 'prct09/matriz_dispersa.rb'
require 'prct09/matriz_densa.rb'
require 'prct09/dsl.rb'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
