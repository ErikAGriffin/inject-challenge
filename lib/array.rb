class Array

  def inject_me(init= :no_init,method= :no_method,&block)

    if !/[0-9]/.match(init.to_s) && init != :no_init
      method = init
      init = 0
    end

    if method != :no_method
      return self.inject_me(init) {|x,y| x.send(method,y)}
    end

    raise 'no block given' if !block_given?
    if (self.length != 0)
      init==nil ? init = 0 : init
      copy = self.dup
      x = copy.shift
      init = block.call(init,x)
      copy.inject_me(init,&block)
    else
      return init
    end
  end




end
