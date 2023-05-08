class NoteModel
  attr_accessor :id, :name, :desc

  def initialize(id: "", name: "", desc: "")
    @id = id
    @name = name
    @desc = desc 
  end

  def to_s
    "[#{id}] : #{name} - #{desc}"
  end
end