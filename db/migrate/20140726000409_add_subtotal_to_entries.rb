class AddSubtotalToEntries < ActiveRecord::Migration
  def change
    add_money :entries, :subtotal, amount: { null: true, default: nil }
  end
end
