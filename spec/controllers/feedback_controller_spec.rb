describe FeedbacksController do
  describe 'GET new' do
    it 'renders the index template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    context 'when given valid params' do
      let(:params) { { feedback: { email: 'email@example.com', name: 'Foo Bar', text: 'Foobar' } } }
      it 'redirects to new form' do
        post :create, params: params
        expect(response).to redirect_to(new_feedback_path)
      end

      it 'has successful notice message' do
        post :create, params: params
        expect(flash[:notice]).to eq 'Feedback successfully created'
      end

      it 'creates record in db' do
        expect { post :create, params: params }.to change(Feedback, :count).by(1)
      end
    end

    context 'when given invalid params' do
      let(:params) { { feedback: { email: 'email.com', name: 'Foo Bar', text: 'Foobar' } } }
      it 'renders new form' do
        post :create, params: params
        expect(response).to render_template :new
      end

      it 'does not create record in db' do
        expect { post :create, params: params }.to_not change(Feedback, :count)
      end
    end
  end
end
