# encoding: utf-8

class CreateDb < ActiveRecord::Migration

  def up
    puts "hello from CreateDb#up"

    LogDb.create           # logs table
    ConfDb.create          # props table
    ActivityDb::CreateDb.new.up # todo/check - use ActivityDb.create if exists???
    Pluto.create
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end

