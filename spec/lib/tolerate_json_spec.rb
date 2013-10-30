require 'spec_helper'
require 'tolerate_json'

class T
  include TolerateJson
end

describe TolerateJson do
  let(:t) { T.new }

  describe "pretty_print_json" do

    it "should format simple json" do
      unformatted = '{"foo":"bar"}'
      formatted= "{\n  \"foo\":\"bar\"\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should format complex json" do
      unformatted = '{"foo":"bar","boolean":true,"Numbers":12345,"baz":"quz"}'
      formatted= "{\n  \"foo\":\"bar\",\n  \"boolean\":true,\n  \"Numbers\":12345,\n  \"baz\":\"quz\"\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should put the last curly brace on its own line" do
      unformatted = '{}'
      formatted= "{\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should put the last suqre bracket on its own line" do
      unformatted = '[]'
      formatted= "[\n]\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should indent nested structures" do
      unformatted = '{"foo":{"bar":"baz"}}'
      formatted= "{\n  \"foo\":{\n    \"bar\":\"baz\"\n  }\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should separate concurrant curly braces with a cr" do
      unformatted = '{"qux":{"foo":{"bar":"baz"}}, "quux":"quuux"}'
      formatted= "{\n  \"qux\":{\n    \"foo\":{\n      \"bar\":\"baz\"\n    }\n  },\n   \"quux\":\"quuux\"\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should separate numbers and closing curly braces with cr" do
      unformatted = '{"qux":{"foo":1}, "quux":"quuux"}'
      formatted= "{\n  \"qux\":{\n    \"foo\":1\n  },\n   \"quux\":\"quuux\"\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should include only one cr at the end of the result" do
      unformatted = "{}\n\n\n"
      formatted= "{\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should remove any newlines in the input" do
      unformatted = "{\n\"foo\"\n:{\"bar\":\"baz\"}\n\n\n\n\n}"
      formatted= "{\n  \"foo\":{\n    \"bar\":\"baz\"\n  }\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end

    it "should tolerate and format already-formatted json" do
      unformatted = "{\n\t\"foo\":{\n\t\t\"bar\":\"baz\",\n\t\t\"qux\":true\n\t}\n}"
      formatted= "{\n  \"foo\":{\n    \"bar\":\"baz\",\n    \"qux\":true\n  }\n}\n"

      expect(t.pretty_print_json(unformatted)).to eq(formatted)
    end
  end
end