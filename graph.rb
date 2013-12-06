class Mygraph
  attr_accessor :graph, :vertexes

  def initialize(vertexes)
    @vertexes = vertexes
    @graph = Hash.new
    vertexes.each do |vertex|
      @graph[vertex] = Array.new
    end
  end

  def add(v1, v2)
    @graph[v1] << v2
    @graph[v2] << v1
  end

  def draw
    @graph.each do |key,value|
      puts "#{key} => #{value}"
    end
  end

  def degree(vertex)
    @graph[vertex].count
  end

  def maxdegree
    degrees = Array.new
    @vertexes.each do |vertex|
      degrees << degree(vertex)
    end
    degrees.max
  end

  def selfloops
    selfloops = 0
    @vertexes.each do |vertex|
      @graph[vertex].each do |edge|
        edge == vertex ? selfloops += 1 : selfloops;
      end
    end
    selfloops
  end
end

graph = Mygraph.new (1..10).to_a

graph.add(1,2)
graph.add(1,2)
graph.add(1,1)
graph.add(10,9)
graph.add(3,7)
graph.add(4,3)
graph.add(6,4)
graph.add(9,5)
graph.draw

puts "Degree of vertex 3" 
puts graph.degree(3)

puts "Max degree of grpah is" 
puts graph.maxdegree

puts "Number of self loops"
puts graph.selfloops


