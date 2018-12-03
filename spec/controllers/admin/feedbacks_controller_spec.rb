describe Admin::FeedbacksController, type: :controller do
  describe 'GET index' do
    context 'authenticated admin' do
      let(:admin) { create :admin }
      let!(:first_feedback) { create(:feedback, text: 'first feedback') }
      let!(:second_feedback) { create(:feedback, text: 'second feedback') }
      let!(:third_feedback) { create(:feedback, text: 'third feedback') }

      before(:each) { sign_in admin }

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end

      it 'returns all feedbacks if params is empty' do
        get :index
        expect(assigns(:feedbacks)).to eq([first_feedback, second_feedback, third_feedback])
      end

      it 'returns all feedbacks if params is empty' do
        get :index, params: { q: 'first' }
        expect(assigns(:feedbacks)).to eq([first_feedback])
      end

      it 'returns none feedbacks if query is wrong' do
        get :index, params: { q: 'fourth' }
        expect(assigns(:feedbacks)).to eq([])
      end
    end

    context 'unauthenticated' do
      it 'renders the index template' do
        get :index
        expect(response).to redirect_to('/secret_path_admin_asdjadshkas/sign_in')
      end
    end
  end
end
