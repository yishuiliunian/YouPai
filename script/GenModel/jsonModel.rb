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

##本地模型

model("YPQueueModel") { |m|
  string "identifier", m
}

#服务器协议模型
model("YPUserLoginRsq") { |m|
  string "uname",m
  int32 "accountType",m
  string "mobile",m
  int32 "userId",m
  string "email",m
  string "token",m
}

model("YPServerRsq") { |m|
  int32 "code",m
  ID "data",m
  string "engMessage",m
  string "message",m
  int64 "timestamp",m
  string "version",m
}

requestModel("YPUserLoginReq") { |req|
  response "YPUserLoginRsq", req
  method "/queue/api/account/login", req
  p_string "uname", req
  p_string "passwd", req
}


model("YPSPData") { |m|
    int32 "spId" ,m
    string "spName" ,m
    string "lnkphone" ,m
    string "memo" ,m
    double "lat" ,m
    double "lng" ,m
    string "btype" ,m
}

model("YPFindSPRsp") { |m|
    array "list", "YPSPData", m
}

requestModel("YPFindSPReq") { |r|
    response "YPFindSPRsp", r
    method '/queue/api/queue/findSp', r
    p_double "lng", r
    p_double "lat", r
}



model("YPFindSPTypeDetail") { |m|
    string "momo" ,m
    string "spTypeName" ,m
    int32 "spId" ,m
    int32 "spTypeId" ,m
}

model("YPSPDetail") { |m|
    double "lng" ,m
    string "spName" ,m
    string "bzType" ,m
    string "memo" ,m
    string "lnkphone" ,m
    int32 "spId" ,m
    double "lat" ,m
    array "spTypes", "YPFindSPTypeDetail" ,m
}
requestModel("YPSPDetailReq") { |r|
    response "YPSPDetail", r
    method '/queue/api/queue/findSpAndSpType', r
    p_double "lng", r
    p_double "lat", r
}


FindProject()
