require_relative '../1' #подключение файла

RSpec.describe TemperatureConverter do
  describe '.celsius_to_farenheit' do
    it 'выводит правильное значение для 0°C' do
      expect { TemperatureConverter.celsius_to_farenheit(0) }
        .to output("цельсий в фаренгейт 32.0\n").to_stdout
    end

    it 'выводит правильное значение для 100°C' do
      expect { TemperatureConverter.celsius_to_farenheit(100) }
        .to output("цельсий в фаренгейт 212.0\n").to_stdout
    end

    it 'выводит правильное значение для дробных чисел' do
      expect { TemperatureConverter.celsius_to_farenheit(36.6) }
        .to output("цельсий в фаренгейт 97.88\n").to_stdout
    end

    it 'выводит правильное значение для отрицательных чисел' do
	expect { TemperatureConverter.celsius_to_farenheit(-40) }
       	.to output("цельсий в фаренгейт -40.0\n").to_stdout
    end
  end

  describe '.farenheit_to_celsius' do
    it 'выводит правильное значение для 32°F' do
      expect { TemperatureConverter.farenheit_to_celsius(32) }
        .to output("фаренгейт в цельсий 0.0\n").to_stdout
    end

    it 'выводит правильное значение для 212°F' do
      expect { TemperatureConverter.farenheit_to_celsius(212) }
        .to output("фаренгейт в цельсий 100.0\n").to_stdout
    end

    it 'выводит правильное значение для дробных чисел' do
      expect { TemperatureConverter.farenheit_to_celsius(36.6) }
        .to output("фаренгейт в цельсий 2.56\n").to_stdout
    end

    it 'выводит правильное значение для отрицательных чисел' do
        expect { TemperatureConverter.farenheit_to_celsius(-40) }
        .to output("фаренгейт в цельсий -40.0\n").to_stdout
    end

  end
end
