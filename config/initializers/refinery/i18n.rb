# encoding: utf-8

Refinery::I18n.configure do |config|
  config.enabled = true

  config.default_locale = :pl

  config.current_locale = :pl

  config.default_frontend_locale = :pl

  config.frontend_locales = [:pl, :en]

  # config.locales = {:en=>"English", :fr=>"Français", :nl=>"Nederlands", :"pt-BR"=>"Português", :da=>"Dansk", :nb=>"Norsk Bokmål", :sl=>"Slovenian", :es=>"Español", :it=>"Italiano", :de=>"Deutsch", :lv=>"Latviski", :ru=>"Русский", :sv=>"Svenska", :pl=>"Polski", :"zh-CN"=>"Simplified Chinese", :"zh-TW"=>"Traditional Chinese", :el=>"Ελληνικά", :rs=>"Srpski", :cs=>"Česky", :sk=>"Slovenský", :ja=>"日本語", :bg=>"Български"}
  config.locales = { :pl => "Polski", :en => "English"}
end
