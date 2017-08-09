namespace :sucide do
  desc "TODO"
  BaseDir = './public/homedir'
  task dbinit: :environment do
    a = Pathprint.create(pathprint_id: nil ,path: BaseDir, path_type: 'dir', owner: 'shivam', name: 'homedir')
    debugger
  end

  desc "TODO"
  task dbupdate: :environment do
    regex = /([-d])[rwx-]{9}\W+\d+\W+(\w+)\W+\w+\W+\d+\W+\w+\W+\d+\W+[0-9:]+\W+(.+)/

    arrofhshs = [{ BaseDir => `ls -l #{BaseDir}`.scan(regex)}]

    while !arrofhshs.empty?

      lshsh = arrofhshs.first
      arrofhshs.delete_at(0)

      lshsh.each do |key , val|

        lslist = val

        lslist.each do |arr|

          pwd = "#{key}/#{arr[2]}"
          parent = Pathprint.find_by(path: key)
          pathprintobj = Pathprint.new(pathprint_id: parent.id, path: pwd, owner: arr[1], name: arr[2])

          if arr[0] == 'd'
            pathprintobj.path_type = 'dir'
            templist = `ls -l #{pwd}`.scan(regex)
            arrofhshs << {pwd => templist}
          else
            pathprintobj.path_type = 'file'
          end
          pathprintobj.save
        end
      end
    end

  end
end
