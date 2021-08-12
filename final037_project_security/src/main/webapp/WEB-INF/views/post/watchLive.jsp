<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="128kb" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="www.TPP.com.board.model.PptForSaleVO"%>


<%@include file="../includes/header.jsp"%>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>RemoteMonster - Simple Example</title>
  <style>
    #mymain { 
      margin-left: 100px; margin-right: auto; width: 320px; 
    }
    #wingleft { 
    }
    #wingright { 
    }
    #remoteVideo { 
      width: 1200px; height: 600px; background-color: skyblue; 
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
</head>
<body>
  <div id="wingleft"></div>
  <div id="mymain">
    <h2>시청</h2>
    <video id="remoteVideo" autoplay></video>
    <br>
    <button id="mystart" class="btn btn-main">Start</button>
    <button id="mystop" class="btn btn-main" disabled>Stop</button>
  </div>
  <div id="wingright"></div>

  <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@remotemonster/sdk/remon.min.js"></script>
  <script>
  let remon;

  const config = {
    credential: {
      serviceId: 'd0b56cb2-6ac2-4928-9702-9016faa0c80d',
      key: '94e6b313fcee7d51c1c93efb1798ec09c51ae47f99264b952cbc3478e73de509'
    },
    view: {
      remote: '#remoteVideo'
    },
    media: {
      recvonly: true,
      audio: false,
      video: false
    }
  };

  const listener = {
    onCreate(chid) { console.log(`EVENT FIRED: onCreate: ${chid}`); },
    onJoin(chid) { console.log(`EVENT FIRED: onJoin: ${chid}`); $('#mystart').prop( "disabled", true ); $('#mystop').prop( "disabled", false ); },
    onClose() { 
      console.log('EVENT FIRED: onClose'); 
      $('#mystart').prop( "disabled", false ); 
      $('#mystop').prop( "disabled", true ); 
      remon.close();
      remon = new Remon({ config, listener });
    },
    onError(error) { console.log(`EVENT FIRED: onError: ${error}`); },
    onStat(result) { console.log(`EVENT FIRED: onStat: ${result}`); }
  };

  remon = new Remon({ config, listener });

  $('#mystop').click(function(){
    remon.close();
  });

  $('#mystart').click(function(){
    remon.joinCast("my-first-livestreaming");
  });

  </script>
</body>
</html>
