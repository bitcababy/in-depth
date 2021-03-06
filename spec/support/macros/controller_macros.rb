# module ControllerMacros
#   def should_render(template)
#     it "should render the #{template} template" do
#       do_request
#       response.should render_template(template)
#     end
#   end
# 
#   # def should_assign(hash)
#   #   variable_name = hash.keys.first
#   #   model, method = hash[variable_name]
#   #   model_access_method = [model, method].join('.')
#   #   it "should assign @#{variable_name} using #{model_access_method}" do
#   #     expected = "the value returned by #{model_access_method}"
#   #     model.should_receive(method).and_return expected
#   #     do_request
#   #     assigns[variable_name].should == expected
#   #   end
#   # end
#   
#   def should_assign(expected, hash)
#     variable_name = hash.keys.first
#     model, method = hash[variable_name]
#     model_access_method = [model, method].join('.')
#     it "should assign @#{variable_name} using #{model_access_method}" do
#       model.should_receive(method).and_return expected
#       do_request
#       assigns[variable_name].should == expected
#     end
#   end
#     
#   def get(action, *args)
#     define_method :do_request do
#       get action, *args
#     end
#     yield
#   end
# 
#   def put(action, *args)
#     define_method :do_request do
#       put action, *args
#     end
#     yield
#   end
# end
# 
# RSpec.configure do |config|
#   config.extend ControllerMacros, :type => :controller
# end
