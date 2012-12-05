require 'spec_base'
require 'spec_active_record'

describe AktionTestRails::Support::Rails::ModelBuilder do
  include described_class

  describe '#create_table' do
    it "creates a table" do
      create_table('test_table')
      ActiveRecord::Base.connection.table_exists?('test_table').should be_true
    end

    it "creates a table with columns" do
      create_table('test_table') do |t|
        t.column :name, :string
      end
      ActiveRecord::Base.connection.columns('test_table').map(&:name).should include('name')
    end

    it "drops the table if an exception occurs" do
      ActiveRecord::Base.connection.should_receive(:execute).with('DROP TABLE IF EXISTS test_table').twice
      ActiveRecord::Base.connection.stub(:create_table) { raise 'error' }
      create_table('test_table') rescue nil
    end
  end

  describe '#define_model_class' do
    it 'creates a class that extends from ActiveRecord::Base' do
      define_model_class('Foo').superclass.should == ActiveRecord::Base
    end

    it 'class evals the block on the new class' do
      create_table('foos')
      define_model_class('Foo') do
        attr_accessor :bar
      end
      model = Foo.new
      model.bar = 1
      model.bar.should == 1
    end
  end

  describe '#define_model' do
    it 'creates a table' do
      define_model('Foo')
      ActiveRecord::Base.connection.table_exists?('foos').should be_true
    end

    it 'creates a table with the given columns' do
      define_model('Foo', :name => :string)
      ActiveRecord::Base.connection.columns('foos').map(&:name).should include('name')
    end

    it 'creates a class that extends from ActiveRecord::Base' do
      define_model('Foo').superclass.should == ActiveRecord::Base
    end

    it 'class evals the block on the new class' do
      create_table('foos')
      define_model('Foo') do
        attr_accessor :bar
      end
      model = Foo.new
      model.bar = 1
      model.bar.should == 1
    end
  end
end
