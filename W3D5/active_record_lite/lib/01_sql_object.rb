require_relative 'db_connection'
require 'active_support/inflector'
# require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    
    table = self.table_name
    @data ||= []
    if @data == []
      @data = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          "#{table}"
        SQL
    end

    @data.first.map {|el| el.to_sym}
  end

  def self.finalize!
    self.columns.each do |column|

      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end

      define_method(column) do
        self.attributes[column]
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if @table_name == nil
      @table_name = "#{self}".tableize
    end

    @table_name

  end

  def self.all
    table = self.table_name
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{table}"
    SQL

    self.parse_all(results)

  end

  def self.parse_all(results)
    objects = []
    results.each do |attributes|
      objects << self.new(attributes)
    end
    
    objects
  end

  def self.find(id)
    table = self.table_name
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        "#{table}"
      WHERE
        id = ?
    SQL

    if result == []
      return nil
    else
      return self.new(result.first)
    end
    
  end

  def initialize(params = {})
    params.each do |key, val|
      if self.class.columns.include?(key.to_sym)
        k = key.to_sym
        self.send("#{k}=", val)
      else
        raise "unknown attribute '#{key}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    col_names = self.columns.join(',')
    question_marks = Array.new(self.length) { '?' }
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
