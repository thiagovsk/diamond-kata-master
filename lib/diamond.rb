class Diamond

  def build(input)
    base_bytes_number = string_bytes_number(default_char)
    return "#{input}\n" if base_bytes_number - string_bytes_number(input) == 0

    bytes_diference = string_bytes_number(input) - base_bytes_number

    lines = mount_lines(bytes_diference)
    lines.join("\n") + "\n"
  end

  def string_bytes_number(string)
    string.bytes.first
  end

  def default_char
    'A'
  end

  def mount_lines(bytes_diference)
    initial_bytes_difennce = bytes_diference
   [].tap do |lines|
        char ||= default_char
        lines <<  '_' * bytes_diference + char +  '_' * bytes_diference
        char = char.next
        bytes_diference -= 1

      if bytes_diference >= 1
        while bytes_diference != 0
          lines <<  '_' * bytes_diference + char +  '_' + char + '_' * bytes_diference
          bytes_diference -= 1
          char = char.next
        end
      end

      lines <<  char +  '_'  * ((initial_bytes_difennce *2) -1 )+ char
      size = lines.size

      while size != 1
        lines << lines[size - 2]
        size -= 1
      end
    end
  end
end
