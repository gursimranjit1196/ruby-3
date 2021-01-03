def fibbinaci(n = 35)
    return n if n <= 1
    fibbinaci(n-1) + fibbinaci(n-2)
end

begin
    pipe = Ractor.new do
        loop do
            data = Ractor.recv
            Ractor.yield data
        end
    end

    RN = 5

    rs = RN.times.map{ |i|
            Ractor.new pipe, i do |pipe, i|
                msg = pipe.take
                p "Processing #{msg}, #{Time.now}"
                fibbinaci(rand(33..36) + msg)
                p "Done processing #{msg}, #{Time.now}"
                msg
            end
        }

    RN.times{ |i|
        p "Sending data of Index #{i}, #{Time.now}"
        pipe << i
    }
    
    RN.times.map{
        r, n = Ractor.select(*rs)
        rs.delete r
        n
    }

    p "Done..."
rescue => exception
    p "---------------------------Exception in Ractor---------------------------"
    p exception
end
