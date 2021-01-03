require 'benchmark'

def fibbinaci(n)
    return n if n <= 1
    fibbinaci(n-1) + fibbinaci(n-2)
end

reps = 5

Benchmark.bm do |bm|
    bm.report("Sequencial") do
        reps.times do
            fibbinaci 37
        end
    end

    bm.report("Ractor") do
        ractors = []
        reps.times do
            r = Ractor.new do
                fibbinaci 37
            end
            ractors << r
        end
        ractors.length.times.map{
            r, n = Ractor.select(*ractors)
            ractors.delete r
            n
        }
    end
end
