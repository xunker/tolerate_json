require 'spec_helper'
require 'tolerate_json'

describe TolerateJson do

  let(:json) { double(:json_string) }
  let(:indentation_string) { "\t" }

  describe '.pretty_print_json' do
    it 'calls TolerateJson::Formatter' do
      expect(TolerateJson::Formatter).to receive(:format_json_string).with(json, indentation_string)
      TolerateJson.pretty_print_json(json, indentation_string)
    end
  end

  
  describe '#pretty_print_json' do
    it 'calls TolerateJson::Formatter' do
      class T
        include TolerateJson
      end
      t = T.new

      expect(TolerateJson::Formatter).to receive(:format_json_string).with(json, indentation_string)
      t.pretty_print_json(json, indentation_string)
    end
  end
end