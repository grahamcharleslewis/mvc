require_relative "notes_controller"

def match_method(url)
  router = {
    /^notes$/ => "index",
    /^note\/(\d+)$/ => "show(:id)",
    /^note\/new$/ => "new",
    /^note\/(\d+)\/edit$/ => "edit(:id)",
    /^note\/(\d+)\/delete$/ => "destroy(:id)",
  }

  router.each do |key, value|
    if url.match?(key)
      data = url.match(key)
      return value, data[1] if data[1]
      return value
    end
  end
  raise Exception.new "No match found"
end

controller = NotesController.new
url = ""

# Stub test data
(1..6).each do |id|
  note = NoteModel.new(name: "Test #{id}", desc: "Testing... #{id}")
  controller.create(note)
end

while url != "exit" do
  print "$ "
  url = gets.chomp
  begin
    method, param = match_method(url)
    if param
      controller.send(method.gsub("(:id)", ""), param)
    else
      controller.send(method)
    end
  rescue Exception => e
    puts e.message unless url == "exit"
  end
end 