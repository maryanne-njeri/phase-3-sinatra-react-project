class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
  # task :allow_methods, "GET, HEAD, POST, PUT, OPTIONS, DELETE"
  set :allow_origin, "http:/localhost:3000"
   set :bind, '0.0.0.0'
configure do
  enable :cross_origin
end
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end
# routes...
options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end
  #get method
      get '/constructions/:id' do
          constructions = Construction.find(params[:id])
          constructions.to_json
      end
      get "/clients" do
        clients = Client.all
        clients.to_json
        end
      get "/constructions" do
        all_construction = Construction.all
        all_construction.to_json
        end
      get '/clients/:id' do
          client = Client.find(params[:id])
          client.to_json
      end
      get "/project_managers" do
          manager = Project_manager.all
          manager.to_json
      end
      get '/project_managers/:id' do
          project_manager = Project_manager.find(params[:id])
          project_manager.to_json
      end

  #post
      post '/clients' do
          client = client.create(
          name: params[:name],
          location: params[:location],
          email: params[:email]
          )
          client.to_json
      end

    post '/constructions' do
      construction = Construction.create(
        description: params[:description],
        client_id: params[:client_id],
        project_manager_id: params[:project_manager_id]
      )
      construction.to_json
    end

    post '/project_managers' do
      project_manager = Project_manager.create(
        name: params[:name],
        age: params[:age],
        experience: params[:experience]
      )
      project_manager.to_json
    end
    #patch method
    patch '/clients/:id' do
      client_fixing = Client.find(params[:id])
      client_fixing.update(
        name: params[:name],
          location: params[:location],
          email: params[:email]
      )
      client_fixing.to_json
    end
    patch '/constructions/:id' do
      construction_fixing = Construction.find(params[:id])
      construction_fixing.update(
          description: params[:description],
          client_id: params[:client_id],
          project_manager_id: params[:project_manager_id]
        )
        construction_fixing.to_json
    end

    patch '/project_manager/:id' do
      manager_fixing = Driver.find(params[:id])
      manager_fixing.update(
        name: params[:name],
        age: params[:age],
        experience: params[:experience]
      )
      manager_fixing.to_json
    end
    #delete method
    delete '/clients/:id' do
      delete_client = Client.find(params[:id])
      delete_client.destroy
      delete_client.to_json
  end
    delete '/constructions/:id' do
      delete_construction = Construction.find(params[:id])
      delete_construction.destroy
      delete_construction.to_json
  end
    delete '/project_managers/:id' do
      delete_manager = Project_manager.find(params[:id])
      delete_manager.destroy
      delete_manager.to_json
  end
end