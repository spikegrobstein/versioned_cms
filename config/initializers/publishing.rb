PUBLISHING_CONFIG = YAML.load_file("#{Rails.root}/config/publishing.yml")[Rails.env]

# if it's not an absolute path, make it relative to Rails.root
unless PUBLISHING_CONFIG['location'].match /^\//
  PUBLISHING_CONFIG['location'] = File.join(Rails.root, PUBLISHING_CONFIG['location'])
end