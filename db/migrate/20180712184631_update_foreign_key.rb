class UpdateForeignKey < ActiveRecord::Migration[5.2]
  def change
    # remove the old foreign_key
    remove_foreign_key :answers, :questions

    # add the new foreign_key
    add_foreign_key :answers, :questions, on_delete: :cascade
  end
end
