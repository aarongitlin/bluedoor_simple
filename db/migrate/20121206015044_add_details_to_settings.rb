class AddDetailsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :address, :string
    add_column :settings, :facebookurl, :string
    add_column :settings, :twitterhandle, :string
    add_column :settings, :thankyoutext, :text
  end
end
