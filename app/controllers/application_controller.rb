class ApplicationController < ActionController::API

	$id = 1
	def postOrder(item)
		if item == "." or item == ".."
			return
		end
		owner = "#{%x{stat -c '%U' #{item}}}"
		path = "#{item}/"
		tpath = "#{item}"
		parent = tpath.split("/")[-2]
		%x{echo node: "#{item} #{parent} #{$id}" >> output}
		temp = tpath.split("/")[-1]
		if File.directory?(item)
			$id = $id + 1
			ptype = "directory"
			if(temp == "test")
				return
			end
			Dirdetail.create(name: temp, path: path, owner: owner, ptype: ptype, parent: parent)
			Dir.foreach(item) do |itr|
				if itr == "." or itr == ".."
					@test = 0
				else
					x = "#{item}/#{itr}"
					postOrder(x)
				end
			end
		else
			@dirID = Dirdetail.find_by(name: parent)
			if(@dirID == nil)
				@dirID = 1
			else
				@dirID = @dirID.id
			end
			@x = Filedetail.new(name: temp, path: path, owner: owner, ptype: ptype, parent: parent,  dirdetail_id: @dirID)
			@x.save
			%x{echo errors: #{@x.errors.full_messages}}
		end
	end

	def postOrderupdate(item)
		if item == "." or item == ".." or File.directory?(item) == false
			return
		end
		tpath = "#{item}"
		temp = tpath.split("/")[-1]
		if(temp == "test")
			return
		end
			Dir.foreach(item) do |itr|
				if itr == "." or itr == ".."
					@test = 0
				else
					x = "#{item}/#{itr}"
					@node = Dirdetail.find_by path: x
					@node.dirdetail_id = Dirdetail.find_by(path: tpath).id
					postOrderupdate(x)
				end
			end
	end
	def update
		Dirdetail.create(name: "root", path: "/", owner: "shan2new", ptype: "files", parent: "self")
		Dir.foreach(Dir.pwd) do |item|
			postOrder(item)		
		end
		redirect_to dirdetails_path
	end	

end
