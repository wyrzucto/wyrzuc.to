if %w( test test_codeship development ).include?(Rails.env)
  PolishGeeks::DevTools.setup do |config|
    # We are going to enable those options step by step
    config.brakeman = false
    config.rubycritic = false
    config.simplecov_threshold = 0
    config.yard = false
    config.empty_methods = false
    config.haml_lint = false
    config.rspec_files_structure = false
    config.final_blank_line_ignored = %w(
      db/test.sqlite3
      db/development.sqlite3
    )
  end
end
