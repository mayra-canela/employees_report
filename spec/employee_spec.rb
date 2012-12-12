require 'employee'
require 'pry'

describe Employee do

  before(:each) { @employee = Employee.new(firstname: "Antonio", lastname: "Chavez", account_number: 1232344545, hours_week: 40) }

  context '#validations' do

    it 'Should not allow to create blank objects' do
      expect { Employee.new }.to raise_error
    end

    it 'should initialize rate with zero' do
      @employee.rate.should == 25
    end

    it 'should validate if the account number is the same' do
      employee = Employee.new(firstname: "Antonio", lastname: "Chavez", account_number: 1232344545, hours_week: 40)
      Employee.all.count.should == 1
    end

  end

  context '#calculations' do

    it 'should have salary as calculated attribute' do
      @employee.worked_hours = 35
      @employee.salary.should == 875
    end

    it 'should save the objects as class attribute' do
      Employee.all.count.should == 1
    end

  end

end
