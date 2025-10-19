require_relative '../1' # подключение файла

RSpec.describe TemperatureConverter do
  describe '#to_fahrenheit' do
    it 'конвертирует 0°C в 32°F' do
      converter = TemperatureConverter.new(0, 'celsius')
      expect(converter.to_fahrenheit).to eq(32.0)
    end

    it 'конвертирует 100°C в 212°F' do
      converter = TemperatureConverter.new(100, 'celsius')
      expect(converter.to_fahrenheit).to eq(212.0)
    end

    it 'конвертирует дробные числа (36.6°C в 97.88°F)' do
      converter = TemperatureConverter.new(36.6, 'celsius')
      expect(converter.to_fahrenheit).to eq(97.88)
    end

    it 'конвертирует отрицательные числа (-40°C в -40°F)' do
      converter = TemperatureConverter.new(-40, 'celsius')
      expect(converter.to_fahrenheit).to eq(-40.0)
    end
  end

  describe '#to_celsius' do
    it 'конвертирует 32°F в 0°C' do
      converter = TemperatureConverter.new(32, 'fahrenheit')
      expect(converter.to_celsius).to eq(0.0)
    end

    it 'конвертирует 212°F в 100°C' do
      converter = TemperatureConverter.new(212, 'fahrenheit')
      expect(converter.to_celsius).to eq(100.0)
    end

    it 'конвертирует дробные числа (97.88°F в 36.6°C)' do
      converter = TemperatureConverter.new(97.88, 'fahrenheit')
      expect(converter.to_celsius).to eq(36.6)
    end

    it 'конвертирует отрицательные числа (-40°F в -40°C)' do
      converter = TemperatureConverter.new(-40, 'fahrenheit')
      expect(converter.to_celsius).to eq(-40.0)
    end
  end

  describe '#convert_to' do
    it 'выводит правильное сообщение для конвертации Цельсий в Фаренгейт' do
      converter = TemperatureConverter.new(0, 'celsius')
      expect { converter.convert_to('fahrenheit') }
        .to output("0.0°C в фаренгейт: 32.0°F\n").to_stdout
    end

    it 'выводит правильное сообщение для конвертации Фаренгейт в Цельсий' do
      converter = TemperatureConverter.new(32, 'fahrenheit')
      expect { converter.convert_to('celsius') }
        .to output("32.0°F в цельсий: 0.0°C\n").to_stdout
    end

    it 'выводит правильное сообщение для дробных чисел' do
      converter = TemperatureConverter.new(36.6, 'celsius')
      expect { converter.convert_to('fahrenheit') }
        .to output("36.6°C в фаренгейт: 97.88°F\n").to_stdout
    end

    it 'возвращает правильное значение при конвертации' do
      converter = TemperatureConverter.new(100, 'celsius')
      result = converter.convert_to('fahrenheit')
      expect(result).to eq(212.0)
    end
  end

  describe 'инициализация' do
    it 'корректно работает с целыми числами' do
      converter = TemperatureConverter.new(25, 'celsius')
      expect(converter.to_fahrenheit).to eq(77.0)
    end

    it 'корректно работает со строковыми числами' do
      converter = TemperatureConverter.new('25', 'celsius')
      expect(converter.to_fahrenheit).to eq(77.0)
    end

    it 'приводит шкалу к нижнему регистру' do
      converter = TemperatureConverter.new(0, 'CELSIUS')
      expect(converter.to_fahrenheit).to eq(32.0)
    end
  end
end

# Тесты для вспомогательной функции number?
RSpec.describe 'number?' do
  it 'возвращает true для целых чисел' do
    expect(number?('123')).to be true
  end

  it 'возвращает true для дробных чисел' do
    expect(number?('123.45')).to be true
  end

  it 'возвращает true для отрицательных чисел' do
    expect(number?('-123')).to be true
  end

  it 'возвращает false для нечисловых строк' do
    expect(number?('abc')).to be false
  end

  it 'возвращает false для пустой строки' do
    expect(number?('')).to be false
  end
end