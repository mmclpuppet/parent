# frozen_string_literal: true

def list_products(branch_data)
  puts '_________________'
  puts ''
  puts 'Current products:'
  order = 1
  sorted = branch_data['products'].sort_by { |v| v['repo_name'] }
  branch_data['products'].each do |product|
    if product['shared_docs']
      puts "#{order}. #{product['repo_name']} - #{product['repo_branch']}"
      order += 1
    end
  end
  puts '_________________'
end
