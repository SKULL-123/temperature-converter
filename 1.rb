# Конвертер температур между шкалами цельсия и фаренгейта
  class TemperatureConverter
	# конвертирует температуру из Цельстя в Фаренгейт
	#
	# @param celsius [Integer, Float] значение температуры в градусах Цельсия
	# @return [Float] значение в градусах Фаренгейта
	def self.celsius_to_farenheit(celsius)
		result = ((celsius * 1.8)+32);
		puts "цельсий в фаренгей #{result.round(2)}";
		result # возвращаем значение для тестов
	end;

	# конвертирует температуру из Фаренгейта в Цельсий
	#
	# @param farenheit [Integer, Float] значение температуры в градусах Фаренгейта
	# @return [Float] значение в градусах Цельсия
	def self.farenheit_to_celsius(farenheit)
		result = ((farenheit - 32) * 5.0/9);
                puts "фаренгейт в цельсий #{result.round(2)}";
		result # возвращаем значение для тестов
	end;
end;

# Проверяет, является ли строка числом
# @param str [String] входная строка
# @return [Boolean] true если строка может быть преобразована в число
def number?(str)
	true if Float(str) rescue false
end

if __FILE__ == $0
# Основная логика программы
if number?(ARGV[0])
	TemperatureConverter.celsius_to_farenheit(ARGV[0].to_f);
else 
	puts "Первый аргумент должен быть числом"
end

if number?(ARGV[1])
	TemperatureConverter.farenheit_to_celsius(ARGV[1].to_f);
else
	puts "Второй аргумент должен быть числом"
end
end
