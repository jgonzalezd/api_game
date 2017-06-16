shared_context 'a failed create' do
   it 'returns an unprocessable entity (422) status code' do
     expect(response.status).to eq(422)
   end

   it 'returns the error messages' do
     json = JSON.parse(response.body)['errors']
     expect(json['error']).to eq(message)
   end
 end

 shared_context 'a successful show request' do |root|
   it_behaves_like 'a successful request'

   it 'returns the specified item' do
     json = JSON.parse(response.body)[root]
     expect(json['id']).to eq(id)
   end
 end

 shared_context 'a successful request' do
   it 'returns an OK (200) status code' do
     expect(response.status).to eq(200)
   end
 end

 shared_context 'has a game object payload' do |root|
   it 'responds with a game json object' do
     json = JSON.parse(response.body)
     expect(json['id']).to be_truthy
     expect(json['board'].size).to be 5
     expect(json['score']).to be_truthy
     expect(json['words'].class).to be Array
   end
 end
