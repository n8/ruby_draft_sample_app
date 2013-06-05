class DocumentsController < ApplicationController
  def index
    @documents = access_token.get("/api/v1/documents.json").parsed if access_token
  end

  def create
    access_token.post("/api/v1/documents.json", params: {document: {content: params[:content]}})
    redirect_to root_url
  end

  def show
    @document = access_token.get("/api/v1/documents/#{params[:id]}.json").parsed

    @forks = access_token.get("/api/v1/documents/#{params[:id]}/forks.json").parsed

    @savepoints = access_token.get("/api/v1/documents/#{params[:id]}/savepoints.json").parsed
  end

  def share 
    @document = access_token.post("/api/v1/documents/#{params[:id]}/share.json").parsed
    redirect_to document_path(id: params[:id])
  end

  def destroy
    @document = access_token.delete("/api/v1/documents/#{params[:id]}.json").parsed
    redirect_to root_url
  end

  def create_savepoint
    access_token.post("/api/v1/documents/#{params[:id]}/savepoints.json").parsed
    redirect_to document_path(id: params[:id])
  end

  def show_savepoint
    @savepoint = access_token.get("/api/v1/savepoints/#{params[:id]}.json").parsed
  end
end
