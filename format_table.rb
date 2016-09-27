# Make all the cells a nice size.
#
# usage: ruby format_table.rb file.md
#

new_markdown =
	File.foreach(ARGV[0]).chunk do |line|
		line[0] == "|"
	end.map do |is_table, chunk|
		if !is_table
			chunk
		else
			col_widths = {}
			chunk.each do |line|
				line.strip[1..-1].split("|").each_with_index do |col, i|
					col_widths[i] ||= 0
					unless col =~ /^-+$/
						col_widths[i] = [col_widths[i], col.strip.size].max
					end
				end
			end
			chunk.map do |line|
				new_cells =
					line.strip[1..-1].split("|").each_with_index.map do |col, i|
						if col =~ /^-+$/
							"-" * (col_widths[i] + 2)
						else
							" %-#{col_widths[i]}s " % col.strip
						end
					end
				"|#{new_cells.join("|")}|\n"
			end
		end
	end.map(&:join).join

File.write(ARGV[0], new_markdown)
