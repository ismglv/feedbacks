describe FeedbackNotificationMailer, :type => :mailer do
  describe 'notify' do
    let(:feedback) { create :feedback }
    let(:mail) { FeedbackNotificationMailer.send_notification(feedback) }

    it 'renders the headers' do
      expect(mail.to).to eq(['admin@example.com'])
      expect(mail.subject).to eq("From #{feedback.email}, #{feedback.name}")
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(feedback.text)
    end
  end
end
