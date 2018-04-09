describe FactoryBot do
  FactoryBot.factories.map(&:name).each do |factory_name|
    describe "The #{factory_name} factory" do
      it { expect(FactoryBot.build(factory_name)).to be_valid }
    end
  end
end
