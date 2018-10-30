class Diamond
  def initialize
    @lines = []
    @char = 'A'
  end

  def build(input)
    base_bytes_number = string_bytes_number(char)
    return "#{input}\n" if (base_bytes_number - string_bytes_number(input)).zero?

    bytes_diference = string_bytes_number(input) - base_bytes_number

    mount_diamond(bytes_diference)
    lines.join("\n") + "\n"
  end

  private

  attr_accessor :char
  attr_accessor :lines

  def string_bytes_number(string)
    string.bytes.first
  end

  def mount_diamond(bytes_diference)
    head_diamond(bytes_diference)
    body_diamond(bytes_diference)
    center_diamond(bytes_diference)
    mirror_half_diamond
  end

  def head_diamond(bytes_diference)
    underscores = '_' * bytes_diference
    lines << underscores + char + underscores
  end

  def body_diamond(bytes_diference)
    initial_bytes_diference = bytes_diference
    char.next!
    bytes_diference -= 1

    if bytes_diference >= 1
      while bytes_diference != 0
        underscore_count = ((initial_bytes_diference - bytes_diference) * 2) - 1
        lines << '_' * bytes_diference + char + '_' * underscore_count + char + '_' * bytes_diference
        bytes_diference -= 1
        char.next!
      end
    end
  end

  def center_diamond(bytes_diference)
    lines << char + '_' * ((bytes_diference * 2) - 1) + char
  end

  def mirror_half_diamond
    size = lines.size
    while size != 1
      lines << lines[size - 2]
      size -= 1
    end
  end
end
