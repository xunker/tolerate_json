require "tolerate_json/version"

module TolerateJson
  def pretty_print_json(json, indentation_character = '  ')
    return json if json.to_s.size < 1

    json.gsub!("\r\n", '')
    json.gsub!("\n", '')
    json.gsub!("\r", '')

    if json.match(/[^\n]\}$/)
      json.gsub!(/\}$/, "\n}")
      json.gsub!(/\}\}/, "}\n}")
    end

    if json.match(/[^\n]\]$/)
      json.gsub!(/\]$/, "\n]")
    end

    json = json.to_s.gsub(/\{[\s+]\"/, "{\"").gsub(/\{(\s+)\"/, "{\"").gsub(/\"(\s+)\}/, "\"}").gsub(/true(\s+)\}/, "true}").gsub(/false(\s+)\}/, "false}").gsub(/\",(\s+)\"/, '","')

    json = json.gsub("},", "},\n").gsub("],", "],\n").gsub("{[", "{\n[").gsub("}]", "}\n]").gsub("[{", "[\n{").gsub("]}", "]\n}").gsub("{\"", "{\n\"").gsub("\"}", "\"\n}").gsub("\",\"", "\",\n\"").gsub(":true,\"", ":true,\n\"").gsub(":false,\"", ":false,\n\"").gsub(":true}", ":true\n}").gsub(":false}", ":false\n}").gsub(/:(\d+)}/) { ":#{$1}\n}" }.gsub(/\:(\d+),\"/) { ":#{$1},\n\"" }.gsub(/\:(\d+),\"/,":\1,\n\"")

    output = []

    indent_level = 0
    json.split("\n").each do |s|
      indent_level -= 1 if ["]", "}"].include?(s.split('').first) && indent_level > 0
      output << (indentation_character*indent_level) + s
      if ["{", "["].include?(s.split('').last)
        indent_level += 1
        next
      end

      if ["{", "["].include?(s.split('').first)
        indent_level += 1
        next
      end
    end
    output.join("\n")+"\n"
  end
end
