class Todos

  def self.name(id)
    if Todos.all[id.to_s].present?
    	Todos.all[id.to_s]["name"]
    else
      nil
    end
  end

  def self.find(id)
    Todos.all[id.to_s]
  end

  def self.where(*args)
  	todos =  Todos.all
  	args[0].stringify_keys.each do |k,v|
      todos = todos.select{|key, hash| hash[k] == v }
    end
    todos
  end

  def self.all
  	self.initial()
    @firebase.get("todos", {'name' => 'zzz'}).body
  end

  def self.create(data)
  	self.initial()
    @firebase.push("todos", data)

    # or 預儲索引
    # Todo_index(index_id: @firebase.push("todos", data))
  end

  def self.update(id, data)
  	self.initial()
    @firebase.update("todos/#{id}", data)
  end

  def self.delete(id)
  	self.initial()
    @firebase.delete("todos/#{id}")
  end

  def self.first
    Todos.all&.to_a[0] || []
  end

  def self.last
    Todos.all&.to_a[-1] || []
  end

  def self.ids
    Todos.all.keys
  end

  protected

  def self.initial()
    base_uri = "https://eng-hash-191109.firebaseio.com/"
    @firebase = Firebase::Client.new(base_uri)
  end
end