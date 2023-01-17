RSpec.configure do |config|
  config.before(type: :system) do |example|
    if example.metadata[:driver]
      driven_by example.metadata[:driver]
    end
  end
end
