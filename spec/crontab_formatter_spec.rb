require './crontab_formatter.rb'
require 'rspec'
require 'spec_helper.rb'

describe CrontabFormatter do
  context "formatter" do
    it "outputs valid crontab" do
      formatter = CrontabFormatter.new(:minute => [30], :hour => [1,5], :day_of_month => nil, :month => [2], :day_of_week => [0], :command => "/task.rb")
      expect(formatter.convert_to_cron_command).to eq("30 1,5 * 2 0 /task.rb")
    end
  end

  context "vals" do
    it "join with multiple" do
      formatter = CrontabFormatter.new(:minute => [30,60])

      expect(formatter.join_vals(formatter.minute)).to eq("30,60")
    end

    it "join when single" do
      formatter = CrontabFormatter.new(:minute => [30])

      expect(formatter.join_vals(formatter.minute)).to eq("30")
    end

    it "return * when none" do
      formatter = CrontabFormatter.new(:minute => nil)

      expect(formatter.join_vals(formatter.minute)).to eq("*")
    end
  end
end