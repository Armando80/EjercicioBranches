#crea la torta
#refactor tortas
#empujar rama
class Torta

	COOKING_TIMES = {jamon: 5, pierna: 10, milanesa: 15}

	attr_reader :type, :cooking_time

	def initialize(type)
		@type = type
		@cooking_time = COOKING_TIMES[@type]
	end

	# def cooking_time
	# 	@cooking_time
	# end

	# def type
	# 	@type
	# end

	# def type=(new_type)
	# 	@type = new_type
	# end

end

class Batch
 
 attr_reader :type, :size, :tortas	

 def initialize(number, type)
 		@type = type
 		@number = number
 		@tortas = []
 		create_batch
 end

 def size
 	@number
 end


 private

 def create_batch
 		@number.times { @tortas.push(Torta.new(@type)) }
 end

end

class Oven

	def initialize(capacity)
		@capacity = capacity
		@batch_in = nil
		@time = 0
	end


	def place_batch_inside(batch)
		if empty? 
		  @batch_in = batch
		else
		  "Full oven waith"
	  end
	end

	def cook_batch(cooking_time)

		until @time == cooking_time
			update_time
			status
			puts "Time: #{@time}"
		end
	end

	def take_out_batch

		return @batch_in
	end

	def empty?
		# result = false
		# result = true if @batch_in !== nil
		# result
		!@batch_in
	end

	private

	def update_time
		@time += 1
	end

	def status

		puts "No hay nada adentro" if @batch_in == nil 

		@ready_time = @batch_in.tortas[0].cooking_time

		if @ready_time < @time 
			 puts "burn"
		elsif @ready_time == @time 		
			 puts "ready"
		elsif  @time < @ready_time / 2
			 puts "almost ready"
		else
			 puts "undercooked"
		end		
	end

end





oven = Oven.new(20)

batch_jamon = Batch.new(8,:jamon)
batch_pierna = Batch.new(8,:pierna)

oven.place_batch_inside(batch_jamon)
oven.place_batch_inside(batch_pierna)
oven.cook_batch(6)
oven.take_out_batch





# batch_jamon = Batch.new(8,:jamon)

# p batch_jamon
# p batch_jamon.type
# p batch_jamon.size
# p batch_jamon.tortas




# torta_jamon = Torta.new(:jamon)

# p torta_jamon

# p torta_jamon.type
# p torta_jamon.cooking_time

# torta_pierna = Torta.new(:pierna)
# p torta_pierna
# p torta_pierna.type
# p torta_pierna.cooking_time


# var = 3
# var = {hola: "hello"}
# jamon = Batch.new(8,:jamon)
# str = "kjshdf"

# puts "verdadero" if !str
# puts "verdadero" if ![]
# puts "verdadero" if !var
# puts "verdadero" if !jamon
# puts "verdadero" if !true
# puts "verdadero" if !nil
# puts "verdadero" if !false