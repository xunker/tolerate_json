require 'spec_helper'
require 'tolerate_json'

describe TolerateJson::Formatter do

  describe "pretty_print_json" do

    it "should format simple json" do
      unformatted = '{"foo":"bar"}'
      formatted= "{\n  \"foo\":\"bar\"\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end

    it "should format complex json" do
      unformatted = '{"foo":"bar","boolean":true,"Numbers":12345,"baz":"quz"}'
      formatted= "{\n  \"foo\":\"bar\",\n  \"boolean\":true,\n  \"Numbers\":12345,\n  \"baz\":\"quz\"\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end

    describe 'arrays' do
      context 'array is empty' do
        it "should not add a cr between the square braces of an empty array" do
          unformatted = "{\"foo\":[]}"
          formatted= "{\n  \"foo\":[]\n}\n"

          expect(subject.format_json_string(unformatted)).to eq(formatted)
        end
      end

      context 'array is not empty' do
        it "should put the last square bracket on its own line" do
          unformatted = '["foo", "bar", "baz"]'
          formatted= "[\"foo\",\n  \"bar\",\n  \"baz\"\n]\n"

          expect(subject.format_json_string(unformatted)).to eq(formatted)
        end
      end
    end

    describe 'hashes' do
      context 'hash is empty' do
        it "should not add a cr between the curly braces of an empty hash" do
          unformatted = "{\"foo\":{}}"
          formatted= "{\n  \"foo\":{}\n}\n"

          expect(subject.format_json_string(unformatted)).to eq(formatted)
        end
      end

      context 'hash is not empty' do
        it "should put the last curly brace on its own line" do
          unformatted = '{"foo":"bar"}'
          formatted= "{\n  \"foo\":\"bar\"\n}\n"

          expect(subject.format_json_string(unformatted)).to eq(formatted)
        end
      end
    end

    it "should indent nested structures" do
      unformatted = '{"foo":{"bar":"baz"}}'
      formatted= "{\n  \"foo\":{\n    \"bar\":\"baz\"\n  }\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end

    it "should separate concurrant curly braces with a cr" do
      unformatted = '{"qux":{"foo":{"bar":"baz"}}, "quux":"quuux"}'
      formatted= "{\n  \"qux\":{\n    \"foo\":{\n      \"bar\":\"baz\"\n    }\n  },\n   \"quux\":\"quuux\"\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end

    it "should separate numbers and closing curly braces with cr" do
      unformatted = '{"qux":{"foo":1}, "quux":"quuux"}'
      formatted= "{\n  \"qux\":{\n    \"foo\":1\n  },\n   \"quux\":\"quuux\"\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end

    it "should include only one cr at the end of the result" do
      unformatted = "{}\n\n\n"
      formatted= "{\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end

    it "should remove any newlines in the input" do
      unformatted = "{\n\"foo\"\n:{\"bar\":\"baz\"}\n\n\n\n\n}"
      formatted= "{\n  \"foo\":{\n    \"bar\":\"baz\"\n  }\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end

    it "should tolerate and format already-formatted json" do
      unformatted = "{\n\t\"foo\":{\n\t\t\"bar\":\"baz\",\n\t\t\"qux\":true\n\t}\n}"
      formatted= "{\n  \"foo\":{\n    \"bar\":\"baz\",\n    \"qux\":true\n  }\n}\n"

      expect(subject.format_json_string(unformatted)).to eq(formatted)
    end
  end
end