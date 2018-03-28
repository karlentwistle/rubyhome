# This is an automatically generated file, please do not modify

module Rubyhome
  class Service
    class SecuritySystem < Service
      class << self
        def uuid
          "0000007E-0000-1000-8000-0026BB765291"
        end

        def name
          :security_system
        end

        def required_characteristic_uuids
          ["00000066-0000-1000-8000-0026BB765291", "00000067-0000-1000-8000-0026BB765291"]
        end

        def optional_characteristic_uuids
          ["00000077-0000-1000-8000-0026BB765291", "0000007A-0000-1000-8000-0026BB765291", "0000008E-0000-1000-8000-0026BB765291", "00000023-0000-1000-8000-0026BB765291"]
        end
      end

      def name
        "Security System"
      end
    end
  end
end
