class Diamond

  def build(input)
    base_bytes_number = string_bytes_number('A')
    return "#{input}\n" if base_bytes_number - string_bytes_number(input) == 0
  end

  def string_bytes_number(string)
    string.bytes.first
  end
end
