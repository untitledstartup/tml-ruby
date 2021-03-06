# encoding: UTF-8

require 'spec_helper'

describe Tml::Config do
  describe "loading defaults" do
    it "should load correct values" do
      expect(Tml.config.logger[:enabled]).to be_falsey
      expect(Tml.config.enabled?).to be_truthy
      expect(Tml.config.default_locale).to eq("en")
      expect(Tml.config.cache).to be_nil
      expect(Tml.config.logger[:path]).to eq("./log/tml.log")
    end
  end

  describe "configuring settings" do
    it "should preserve changes" do
      expect(Tml.config.default_locale).to eq("en")
      Tml.configure do |config|
        config.locale[:default] = 'ru'
      end
      expect(Tml.config.default_locale).to eq("ru")

      Tml.configure do |config|
        config.locale[:default]= 'en'
      end
      expect(Tml.config.default_locale).to eq("en")
    end
  end

end
