class Changenameofapplications < ActiveRecord::Migration[5.2]
    def self.up
      rename_table :applications, :applis
    end

    def self.down
      rename_table :applis, :applications
    end
end
