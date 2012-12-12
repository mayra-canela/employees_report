class Employee

  @@all = []

  attr_accessor :firstname, :lastname, :hours_week, :account_number, :worked_hours, :rate

  def initialize(opts)
    raise ArgumentError if opts.nil?
    @firstname = opts[:firstname]
    @lastname = opts[:lastname]
    @account_number = opts[:account_number]
    @hours_week = opts[:hours_week]
    @firstname = opts[:worked_hours].nil? ? 0 : opts[:worked_hours]
    @rate = opts[:rate].nil? ? 25 : opts[:rate]
    @@all << self unless account_number_uniq?
  end

  def salary
    @worked_hours * @rate
  end

  def self.all
    @@all
  end

  private
  
  def account_number_uniq?
    return true unless @@all.select { |employee| employee.account_number == self.account_number }.shift
  end

end
