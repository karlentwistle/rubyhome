# This is an automatically generated file, please do not modify

module Rubyhome
  class Characteristic
    class Volume < Characteristic
      def self.uuid
        "00000119-0000-1000-8000-0026BB765291"
      end

      def self.name
        :volume
      end

      def self.format
        "uint8"
      end

      def constraints
        {"MaximumValue"=>100, "MinimumValue"=>0, "StepValue"=>1}
      end

      def description
        "Volume"
      end

      def permissions
        ["securedRead", "securedWrite"]
      end

      def properties
        ["read", "write", "cnotify"]
      end

      def unit
        "percentage"
      end
    end
  end
end