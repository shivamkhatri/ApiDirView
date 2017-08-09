class ApplicationController < ActionController::API

	def postOrder(item, id)
		if item == "." or item == ".."
			return
		end
		owner = "#{%x{stat -c '%U' #{item}}}"
		path = "#{item}/"
		tpath = "#{item}"
		parent = tpath.split("/")[-2]
		temp = tpath.split("/")[-1]
		if File.directory?(item)
			ptype = "directory"
			Dirdetail.create(name: temp, path: path, owner: owner, ptype: ptype, parent: parent)
			Dir.foreach(item) do |itr|
				if itr == "." or itr == ".."
					@test = 0
				else
					x = "#{item}/#{itr}"
					postOrder(x, id + 1)
				end
			end
		else
			%x{echo file: "#{item} #{parent} #{id}" >> output}
			@x = Filedetail.new(name: temp, path: path, owner: owner, ptype: ptype, parent: parent,  dirdetail_id: id)
			@x.save
			%x{echo file: "#{@x.errors.full_messages}" >> output}
		end
	end

	def update
		Dir.foreach(Dir.pwd) do |item|
			postOrder(item, 2)		
		end
		redirect_to "localhost:3000/dirdetails/?path=app/"
	end	

end
