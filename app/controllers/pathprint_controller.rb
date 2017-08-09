class PathprintController < ApplicationController

  BaseDir = './public/homedir'

  def full_path(path = "")
    if !path.empty?
      return "#{BaseDir}/#{path}"
    else
      return BaseDir
    end

  end

  def printdir
    uri = ""
    if params[:path]
      uri = full_path(params[:path])
    else
      uri = full_path
      puts uri
    end
    uriobj = Pathprint.find_by(path: uri)
    if uriobj
      render json: uriobj.subdirs
    end
  end

end
