# frozen_string_literal: true

def merge_trees(branch_data)
  Dir.chdir base_dir
  subtree_ssh = 'git@github.com:puppetlabs/shared-common-docs.git'
  branch_data['products'].each do |product|
    if product['shared_docs']
      unless Dir.exist? "repos/#{product['repo_name']}"
        Dir.chdir "#{base_dir}/repos"
        `git clone git@github.com:puppetlabs/#{product['repo_name']}.git`
      end
      Dir.chdir "#{base_dir}/repos/#{product['repo_name']}"
      `git fetch origin`
      `git checkout #{product['repo_branch']}`
      `git subtree pull --prefix shared-common #{subtree_ssh} master --squash -m "Updating subtree"`
      `git push origin #{product['repo_branch']}`
      Dir.chdir base_dir
    end
  end
end
