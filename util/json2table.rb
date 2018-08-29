#!/usr/bin/env ruby

require 'set'

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

def get_cell(path, hash)
    idx = path.index('/')
    idx ? get_cell(path[idx+1..-1], hash[path[0..idx-1]]) : hash[path]
end

def get_row(headers, hash)
    row = []
    headers.each { |cell| row.push(get_cell(cell, hash)) }
    return row
end

def json_to_table(json)
    return nil unless json
    headers = Set.new
    data = Array.new
    if json.respond_to?(:keys)
        get_header(headers, json)
        data.push(get_row(headers, json))
    else
        json.each { |item| get_header(headers, item) }
        json.each { |json_row| data.push(get_row(headers, json_row)) }
    end
    return headers, data
end

