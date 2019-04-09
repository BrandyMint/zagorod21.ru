require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require 'simplecov'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start 'rails'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara-screenshot/rspec'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # ResqueSpec.disable_ext = true

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.fail_fast = false

    config.include FactoryBot::Syntax::Methods


    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    config.before(:suite) do
      #DatabaseCleaner.strategy = :truncation, {
        #:except => %w[]
      #}
    end
    config.before(:each) do
      DatabaseCleaner.start
      #Warden.test_reset!
    end
    config.after(:each) do
      DatabaseCleaner.clean
      #Hotel.tire.index.delete
      #Hotel.tire.create_elasticsearch_index
    end
  end

end

Spork.each_run do
  if Spork.using_spork?
    ActiveSupport::Dependencies.clear
    ActiveRecord::Base.instantiate_observers

    # Иначе jobs не пеергружаются
    #Dir[Rails.root + "app/**/*.rb"].each do |file|
      #load file
    #end
  end
end

def search_form
  SearchForm.new food_state: food_state,
                people_quantity: quantity,
                use_transport: true,
                price_to: price_to,
                date_from: date_from,
                date_to: date_to,
                city: city,
                category: category
end

def house_estimation_test
  let(:resort) { double :resort, distance: 30 }
  let(:category) { create :category, name: 'All houses' }
  let(:quantity) { 12 }
  let(:price_to) { 1 }
  let(:food_state) { 'catering' }
  let(:city) { create :city }

  let(:form_object) { search_form }

  let(:calculator) { HouseCalculator.new house, form_object }
  let(:services) { Hashie::Mash.new transport: 20, food_inplace: 1500, food_catering: 350 }

  before do
    Settings.stub(:services) { services }
  end

  subject { calculator.estimate }
  let(:result) { quantity*form_object.days*services.food_catering  + 2*resort.distance*services.transport + house_price }

  it { should be_a Estimation }
  its(:total) { should eq result }
end

def search_test
  let(:resort) { create :resort, distance: 30 }
  let(:category) { create :category, name: 'All houses' }
  let(:city) { resort.city }
  let(:food_state) { 'catering' }

  before do
    create_houses
  end

  let(:sort_form) { SortForm.new }
  subject(:query) { HouseSearchQuery.new(search_form, sort_form) }

  it { should be_a HouseSearchQuery }
  it "should return houses" do
    query.instance_variable_get("@scope").map(&:id).should =~ expected_houses_ids
  end
end