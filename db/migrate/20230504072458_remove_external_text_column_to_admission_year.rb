class RemoveExternalTextColumnToAdmissionYear < ActiveRecord::Migration[7.0]
  def change
    remove_column :admission_years, :external_text, :string
  end
end
