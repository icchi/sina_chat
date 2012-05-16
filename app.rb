#coding:utf-8

require 'rubygems'
require 'sinatra'
require 'haml'

@@messages = []

get '/' do
  @name = ""
  @error_msg = nil
  set :public, File.dirname(__FILE__) + '/public'
  set :haml, :format => :html5

  haml :index
end

put '/room' do
  set_message
  name = request[:name]

  if name.empty?
    @error_msg = "ログイン名を入力してください。"
    haml :index
  else
    @name = name
    haml :room
  end
end

post '/room' do
  set_message

  @name = get_name
  haml :room
end

private

def get_name
  name = request[:name].nil? ? "" : request[:name]
end

def set_message
  name = get_name
  unless request[:message].nil? || request[:message].empty?
    @@messages <<  [name, request[:message]]
  end

  # 保管するメッセージは100件
  @@messages.delete_at(0) while 100 < @@messages.size

end