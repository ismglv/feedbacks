describe CreateFeedback do
  describe ".call" do
    context "when given valid params" do
      subject(:context) { CreateFeedback.(email: "john@example.com", name: "john smith", text: 'foo barsecret') }

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the new feedback" do
        expect(context.feedback).to eq(Feedback.last)
      end
    end

    context "when given invalid params" do
      subject(:context) { CreateFeedback.(email: "john.com", name: "john smith", text: 'foo barsecret') }

      it "fails" do
        expect(context).to be_a_failure
      end

      it "provides a failure message" do
        expect(context.message).to be_present
      end
    end
  end
end
