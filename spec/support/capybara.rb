RSpec.configure do |config|
  config.before(type: :system) do |example|
    if example.metadata[:driver]
      driven_by example.metadata[:driver]
    else
      driven_by :selenium, using: :headless_chrome, screen_size: [1000, 800]
    end
  end
end
