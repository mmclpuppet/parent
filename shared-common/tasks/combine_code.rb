# frozen_string_literal: true

require 'yaml'

def combine_data(release, preview)
  release_data = YAML.load(File.read(release))
  preview_data = YAML.load(File.read(preview))
  { 'products' => (release_data['products'] << preview_data['products']).flatten }
end
