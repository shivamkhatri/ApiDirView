class ApplicationController < ActionController::API

	def postOrder(item)
		if File.directory?(item)
			owner = "#{%x{stat -c '%U' #{item}}}"
			ptype = "directory"
			path = "#{item}/"
			tpath = "#{item}"
			temp = tpath.split("/")
			temp = temp[-1]
			Dirdetail.create(name: temp, path: path, owner: owner, ptype: ptype)
				Dir.foreach(item) do |itr|
					if itr.include? "." or itr.include? ".." or item.include? "." or item.include? ".."
						@ans1 = @ans1 
					else
						x = "#{item}/#{itr}"
						postOrder(x)
					end
				end
		else
			owner = "#{%x{stat -c '%U' #{item}}}"
			ptype = "file"
			path = "#{item}/"
			tpath = "#{item}"
			temp = tpath.split("/")
			temp = temp[-1]
			Filedetail.create(name: temp, path: path, owner: owner, ptype: ptype)
		
		end
	end
	def update
		Dir.foreach(Dir.pwd) do |item|
			postOrder(item)		
		end
		redirect_to dirdetails_path
	end	

end
