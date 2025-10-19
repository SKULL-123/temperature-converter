# Конвертер температур между шкалами цельсия и фаренгейта
class TemperatureConverter
  # Инициализирует конвертер с заданным значением и шкалой
  #
  # @param value [Numeric] значение температуры
  # @param scale [String] шкала измерения ('celsius' или 'fahrenheit')
  def initialize(value, scale)
    @value = value.to_f
    @scale = scale.downcase
  end

  # конвертирует в Цельсий
  #
  # @return [Float] значение в градусах Цельсия
  def to_celsius
    if @scale == 'fahrenheit'
      ((@value - 32) * 5.0 / 9).round(2)
    else
      @value # в цельсиях
    end
  end

  # конвертирует в Фаренгейт
  #
  # @return [Float] значение в градусах Фаренгейта
  def to_fahrenheit
    if @scale == 'celsius'
      ((@value * 1.8) + 32).round(2)
    else
      @value # в фаренгейтах
    end
  end

  # Выводит результат преобразования в указанную шкалу
  #
  # @param target_scale [String] целевая шкала ('celsius' или 'fahrenheit')
  # @return [Float] результат преобразования
  def convert_to(target_scale)
    target_scale = target_scale.downcase
    case target_scale
    when 'celsius'
      result = to_celsius
      puts "#{@value}°#{@scale[0].upcase} в цельсий: #{result}°C"
    when 'fahrenheit'
      result = to_fahrenheit
      puts "#{@value}°#{@scale[0].upcase} в фаренгейт: #{result}°F"

    end
    result
  end
end

# Проверяет, является ли строка числом
# 
# @param str [String] входная строка
# @return [Boolean] true если строка может быть преобразована в число
def number?(str)
  true if Float(str) rescue false
end

if __FILE__ == $0
  # Основная логика программы с использованием ООП
  
  # Обработка первого аргумента (Цельсий -> Фаренгейт)
  if number?(ARGV[0])
    converter1 = TemperatureConverter.new(ARGV[0].to_f, 'celsius')
    converter1.convert_to('fahrenheit')
  else 
    puts "Первый аргумент должен быть числом"
  end

  # Обработка второго аргумента (Фаренгейт -> Цельсий)
  if number?(ARGV[1])
    converter2 = TemperatureConverter.new(ARGV[1].to_f, 'fahrenheit')
    converter2.convert_to('celsius')
  else
    puts "Второй аргумент должен быть числом"
  end
end