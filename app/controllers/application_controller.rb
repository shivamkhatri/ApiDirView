class ApplicationController < ActionController::API

	$id = 1
	def postOrder(item, id1)
		if item == "." or item == ".."
			return
		end
		owner = "#{%x{stat -c '%U' #{item}}}"
		path = "#{item}/"
		tpath = "#{item}"
		parent = tpath.split("/")[-2]
		%x{echo node: "#{item} #{parent} #{id1} #{$id}" >> output}
		temp = tpath.split("/")[-1]
		if File.directory?(item)
			$id = $id + 1
			ptype = "directory"
			Dirdetail.create(name: temp, path: path, owner: owner, ptype: ptype, parent: parent)
			Dir.foreach(item) do |itr|
				if itr == "." or itr == ".."
					@test = 0
				else
					x = "#{item}/#{itr}"
					postOrder(x, "#{$id}".to_i)
				end
			end
		else
			%x{echo file: "#{id1}" >> output}
			@x = Filedetail.new(name: temp, path: path, owner: owner, ptype: ptype, parent: parent,  dirdetail_id: "#{id1}")
			@x.save
			%x{echo errors: #{@x.errors.full_messages}}
		end
	end

	def update
		Dirdetail.create(name: "root", path: "/", owner: "shan2new", ptype: "files", parent: "self")
		Dir.foreach(Dir.pwd) do |item|
			postOrder(item, $id)		
		end
		redirect_to filedetails_path
	end	

end
