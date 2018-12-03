describe SendNotification do
  describe ".call" do
    let(:feedback) { create :feedback }
    subject(:context) { SendNotification.(feedback: feedback) }

    it "succeeds" do
      expect(context).to be_a_success
    end
  end
end
