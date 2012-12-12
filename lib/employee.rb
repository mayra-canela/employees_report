class Employee

  @@all = []

  attr_accessor :firstname, :lastname, :hours_week, :account_number, :worked_hours, :rate

  def initialize(opts)
    raise ArgumentError if opts.nil?
    @firstname = opts[:firstname]
    @lastname = opts[:lastname]
    @account_number = opts[:account_number]
    @hours_week = opts[:hours_week]
    @worked_hours = opts[:worked_hours].nil? ? 0 : opts[:worked_hours]
    @rate = opts[:rate].nil? ? 25 : opts[:rate]
    @@all << self # this object will store inside this array
  end

  def salary
    @worked_hours * @rate
  end

  def self.all
    @@all
  end

  def self.total
    @@all.map(&:salary).inject(:+)
  end

end
