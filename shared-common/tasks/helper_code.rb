# frozen_string_literal: true

# Finds base directory
module FindDir
  class << self
    attr_accessor :base_dir
  end
  self.base_dir = Dir.pwd
end

def make_directory
  Dir.chdir base_dir
  unless File.exists? "repos"
    Dir.mkdir "repos"
  end
end

def checkout(repo)
  directory = 'puppet-docs-dita-ot'
  repo_exists = Dir.exist? directory
  `git clone #{repo}` unless repo_exists
  Dir.chdir(directory)
  `git checkout master`
  `git pull origin master`
end

def branch_data
  combine_data('preview.yaml', 'release.yaml')
end

def base_dir
  FindDir.base_dir
end
