$LOAD_PATH.unshift(File.dirname(__FILE__))

require "pathname"
require "xcodeproj"
require "genrequest"
require "genmodels"
require "utilities"

def FindProject
  projpath = FindPathHasFile("./", ".xcodeproj")
  p = Pathname.new(projpath).realpath.parent
  root = p.to_path
  filesPath = p.join("YouPai","Classes", "Models", "ProtocolModels", "GenModels").to_path
  puts filesPath
  OutPutFiles(filesPath)
  project = Xcodeproj::Project.open(projpath)
  target = project.targets.first
  group = project.main_group.find_subpath(File.join("YouPai", "Classes", "Models", "ProtocolModels", "GenModels"), true)
  puts group
  group.clear
  fileRefs = []
  Dir.foreach(filesPath) do |file|
    puts file
    if file.end_with?(".")
      next
    end
    fpath = PathJoin(filesPath, file)
    puts fpath
    ref = group.new_reference(fpath)
    fileRefs << ref
  end

  target.add_file_references(fileRefs)


  subclassses = []
  superclasses = []

  $JSONReqeustCache.each_value { |req|
    output = req.output

    subclassses << output.header
    subclassses << output.implitation

    superclasses << output.superHeader
    superclasses << output.superImplitaion
  }

  OutPutFileTo(root, "YouPai/Classes/Network/GenRequest", project, superclasses, true)
  OutPutFileTo(root, "YouPai/Classes/Network/GenProtocols", project, subclassses, false)
  project.save
end


#服务器协议模型
model("YPUserLoginRsq") { |m|
}

requestModel("YPUserLoginReq") { |req|
  response "YPUserLoginRsq", req
  method "/user/login", req
}


FindProject()
