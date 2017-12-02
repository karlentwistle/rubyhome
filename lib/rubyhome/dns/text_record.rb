require 'dnssd/text_record'
require_relative 'device_id'

module Rubyhome
  class TextRecord < DNSSD::TextRecord

    def initialize
      super(to_hash)
    end

    private

    def to_hash
      {
        'c#' => current_configuration_number,
        'ci' => accessory_category_identifier,
        'ff' => feature_flags,
        'id' => device_id,
        'md' => model_name,
        'pv' => protocol_version,
        's#' => current_state_number,
        'sf' => status_flags
      }
    end

    # Current configuration number. Required. Must update when an accessory,
    # service, or characteristic is added or removed on the accessory server.
    # Accessories must increment the config number after a firmware update. This
    # must have a range of 1-4294967295 and wrap to 1 when it overflows. This
    # value must persist across reboots, power cycles, etc.

    def current_configuration_number
      1
    end

    # Accessory Category Identifier. Required. Indicates the category that best
    # describes the primary function of the accessory. This must have a range of
    # 1-65535.

    def accessory_category_identifier
      2
    end

    # Feature flags (e.g. "0x3" for bits 0 and 1). Required if non-zero.

    def feature_flags
      0
    end

    # Status flags (e.g. "0x04" for bit 3). Value should be an unsigned integer.
    # Required if non-zero.

    STATUS_FLAGS = {
      PAIRED: 0,
      NOT_PAIRED: 1,
    }.freeze

    def status_flags
      STATUS_FLAGS[:NOT_PAIRED]
    end

    # Device ID (Device ID (page 36)) of the accessory. The Device ID must be
    # formatted as "XX:XX:XX:XX:XX:XX", where "XX" is a hexadecimal string
    # representing a byte. Required. This value is also used as the accessory's
    # Pairing Identifier.

    def device_id
      DeviceID.generate
    end

    # Model name of the accessory (e.g. "Device1,1"). Required.

    def model_name
      'RubyHome'
    end

    # Protocol version string <major>.<minor> (e.g. "1.0"). Required if value is
    # not "1.0". The client should check this before displaying an accessory to
    # the user. If the major version is greater than the major version the client
    # software was built to support, it should hide the accessory from the user. A
    # change in the minor version indicates the protocol is still compatible. This
    # mechanism allows future versions of the protocol to hide itself from older
    # clients that may not know how to handle it.

    def protocol_version
      1.0
    end

    # Current state number. Required. This must have a value of "1".

    def current_state_number
      1
    end

  end
end