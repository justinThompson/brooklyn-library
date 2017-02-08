<%@ page language="java" import="java.io.IOException"%>
<%@ page language="java" import="com.rabbitmq.client.AMQP"%>
<%@ page language="java" import="com.rabbitmq.client.Channel"%>
<%@ page import="javax.servlet.jsp.JspWriter" %>
<%@ page import="com.rabbitmq.client.Connection" %>
<%@ page import="com.rabbitmq.client.ConnectionFactory" %>
<%@ page import="com.rabbitmq.client.Consumer" %>
<%@ page import="com.rabbitmq.client.DefaultConsumer" %>
<%@ page import="com.rabbitmq.client.Envelope" %>

<html>
<!--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
-->
<head>
  <title>Sample Application Database JSP Page</title>
</head>
<body bgcolor=white>

<table border="0">
  <tr>
    <td align=center>
      <img src="images/bridge-small.png">
    </td>
    <td>
      <h1>RabbitMQ</h1>
      This example allows you to publish messages to a queue</b>.
    </td>
  </tr>
</table>
<br/>

<%
    final String rabbitMqUrl=System.getProperty("brooklyn.example.rabbitmq.host");
    %>
    <a href="<%=rabbitMqUrl %>:15672">RabbitMQ management plugin</a>
    <%

      if (request.getParameter("name")!=null) {
          final String QUEUE_NAME = request.getParameter("queue");

          ConnectionFactory factory = new ConnectionFactory();
          factory.setHost(rabbitMqUrl);
          factory.setPassword("guest");
          factory.setUsername("guest");

          Connection connection = factory.newConnection();
          Channel channel = connection.createChannel();

          channel.queueDeclare(QUEUE_NAME, false, false, false, null);
          channel.basicPublish("", QUEUE_NAME, null, request.getParameter("message").getBytes("UTF-8"));
      }

%>

<br/>

<p>Please enter the queue name and the message:</p>

<form action="rabbitMq.jsp" method="GET">
    <table>
        <tr><td>Queue: </td><td><input type="text" name="queue"></td></tr>
        <tr><td>Message: </td><td><input type="text" name="message"></td></tr>
    </table>
    <input type="submit" value="Submit"/>
</form>

<br/>
<p>Click <a href="index.html">here</a> to go back to the main page.</p>
</body>
</html>
