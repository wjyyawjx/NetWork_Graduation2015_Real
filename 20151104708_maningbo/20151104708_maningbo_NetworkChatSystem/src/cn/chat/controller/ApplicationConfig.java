package cn.chat.controller;

import java.util.Set;

import javax.websocket.Endpoint;
import javax.websocket.server.ServerApplicationConfig;
import javax.websocket.server.ServerEndpointConfig;

public class ApplicationConfig implements ServerApplicationConfig {

	@Override
	public Set<Class<?>> getAnnotatedEndpointClasses(Set<Class<?>> channel) {
		System.out.println("scan WebSocket" + channel.size());
        //返回（起到过滤的作用，可以在返回前把里面部分类进行过滤）
        return channel;
	}

	@Override
	public Set<ServerEndpointConfig> getEndpointConfigs(Set<Class<? extends Endpoint>> channel) {
		System.out.println("实现EndPoint接口的类数量："+channel.size());
		return null;
	}

}
