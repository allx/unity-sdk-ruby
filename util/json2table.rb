#!/usr/bin/env ruby

require 'set'
require 'json'

def get_header(headers, hash, prefix = nil)
    prefix = "#{prefix}/" if prefix
    hash.each do |key, val|
        if val.respond_to?(:key)
            get_header(headers, val, "#{prefix}#{key}")
        else
            next if headers.include?("#{prefix}#{key}")
            headers.add("#{prefix}#{key}")
        end
    end
end

def get_data(path, hash)
    idx = path.index('/')
    idx ? get_data(path[idx+1..-1], hash[path[0..idx-1]]) : hash[path]
end

def gen_header(headers)
    header = ''
    headers.each do |item|
        header += "<th>#{item}</th>"
    end
    return "<thead><tr>#{header}</tr></thead>"
end

def gen_row(headers, hash, style=nil)
    row = ''
    headers.each do |item|
        data = get_data(item, hash)
        row += "<td>#{data}</td>"
    end
    return "<tr #{style}>#{row}</tr>"
end

# TBD: CSS and HTML are mixed with data process
def json_to_table(json, css = nil)
    return nil unless json
    headers = Set.new
    rows = ''
    if json.respond_to?(:keys)
        get_header(headers, json)
        header= gen_header(headers)
        rows = gen_row(headers, json)
    else
        json.each do |item|
            get_header(headers, item)
        end
        header= gen_header(headers)
        count = 0
        json.each do |item|
            rows += gen_row(headers, item, count%2==1 ? "class=\"pure-table-odd\"" : nil)
            count += 1
        end
    end
    "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"pure-min.css\"></head><body><table class=\"pure-table\">#{header}<tbody>#{rows}</tbody></table></body></html>"
end

headers = Set.new
table = JSON.parse(File.read(ARGV[0]))
puts json_to_table(table)

