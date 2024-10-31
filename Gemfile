source "https://rubygems.org"

ruby '3.2.2'

# Gems pour le framework Rails
gem "rails", "~> 7.2.1", ">= 7.2.1.2"
gem "sprockets-rails"
gem "activerecord"
gem "pg", "~> 1.1"               # Base de données PostgreSQL pour Active Record
gem "puma", ">= 5.0"             # Serveur web Puma

# Gems pour le frontend
gem 'bootstrap'
gem 'cssbundling-rails'

# Gems pour JavaScript
gem "importmap-rails"
gem "turbo-rails"                # SPA-like accélérateur de page de Hotwire
gem "stimulus-rails"             # Framework JavaScript de Hotwire

# Pour les APIs JSON
gem "jbuilder"

# Pour la gestion des mots de passe
gem "bcrypt", "~> 3.1.7"

# Pour les fuseaux horaires sur Windows
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Améliore le temps de démarrage de l’application
gem "bootsnap", require: false

group :development, :test do
  # Pour générer de fausses données dans les tests
  gem 'faker'
  
  # Outils de débogage
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Analyse des vulnérabilités de sécurité
  gem "brakeman", require: false

  # Style guide Ruby de Rails
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Console dans les pages d’exception
  gem "web-console"

  # Outils de console interactifs
  gem 'pry'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'dotenv-rails'              # Gestion des variables d’environnement
end

group :test do
  # Tests de système
  gem "capybara"
  gem "selenium-webdriver"
end
