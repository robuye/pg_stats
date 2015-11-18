require 'pg'
require 'yaml'

module PgStats
  class Runner
    attr_reader :connection
    attr_accessor :data

    def initialize(*args, **keywords)
      if args.size > 0
        @connection = PG.connect(*args)
      else
        @connection = keywords.delete(:connection) || PG.connect(**keywords)
      end
    end

    def exec(name)
      connection.exec(query(name)).to_a
    end

    def execute(name)
      connection.execute(query(name)).to_a
    end

    def query(key)
      data['pg_stats'][key]['sql']
    rescue NoMethodError
      raise StandardError.new("data.yml is missing the '#{key}' key.")
    end

    def help(key)
      data['pg_stats'][key]['help']
    rescue NoMethodError
      raise StandardError.new("data.yml is missing the '#{key}' key.")
    end

    def data
      @data ||= YAML.load(File.read(File.join(File.dirname(__FILE__), 'data.yml')))
    end
  end
end
