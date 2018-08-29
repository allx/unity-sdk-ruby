#!/usr/bin/env ruby

require 'nokogiri'

class HTML_builder

    def initialize
        @builder = Nokogiri::HTML::Builder.new
        @doc = @builder.doc

        @builder.html {
            head
            body
        }
    end

    def to_s
        @doc.to_html
    end

    def title(new_title = nil)
        if new_title
            @doc.at('//head').add_child(Nokogiri::XML::Node.new('title', @doc)) unless @doc.at('//title')
            @doc.at('//title').content = new_title
        end
        @doc.at('//title') ? @doc.at('//title').content : nil
    end

    def generate_table(headers, data, id=nil)
        table = Nokogiri::XML::Node.new('table', @doc)
        table['id'] = id if id
        thead = Nokogiri::XML::Node.new('thead', @doc)
        tbody = Nokogiri::XML::Node.new('tbody', @doc)
        table.add_child(thead)
        table.add_child(tbody)

        thead_r = Nokogiri::XML::Node.new('tr', @doc)
        headers.each do |header|
            th = Nokogiri::XML::Node.new('th', @doc)
            th.content = header
            thead_r.add_child(th)
        end
        thead.add_child(thead_r)

        data.each do |row|
            tr = Nokogiri::XML::Node.new('tr', @doc)
            row.each do |cell|
                td = Nokogiri::XML::Node.new('td', @doc)
                td.content = cell
                tr.add_child(td)
            end
            tbody.add_child(tr)
        end

        table
    end

    def apply_css(css_name, table_name = nil)
        begin
           send("apply_css_#{css_name}", table_name)
        rescue NoMethodError => e
            puts "invalid css #{css_name} #{e}"
        end
    end

    def insert(path, content)
        return @doc.at(path) unless @doc.at(path)
        @doc.at(path).add_child(content)
    end

    private

    def apply_css_pure(table_name)

        if  @doc.xpath('//head/link[@href="pure-min.css"]').length == 0
            @doc.at('//head').add_child('<link rel="stylesheet" type="text/css" href="pure-min.css">')
        end

        query = table_name ? "[@id='#{table_name}']" : ''
        tables = @doc.xpath("//table#{query}")

        tables.each do |table|
            table['class'] = 'pure-table'
            count = 1
            for tr in table.xpath('//tbody/tr')
                tr['class'] = 'pure-table-odd' if count %2 == 1
                count += 1
            end
        end
    end

end

