<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="128kb" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="www.TPP.com.board.model.PptForSaleVO"%>


<%@include file="../includes/header.jsp"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="RemoteMonster live media service demo">
    <meta name="author" content="Lucas Choi">

    <title>CallKit Class Test</title>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <h3 class="h3 mb-4 text-gray-800">CallKit Class Test</h3>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h4 class="font-weight-bold">How to use</h4>
                <li>??????????????? Remon Call Kit??? ???????????? ?????????. </li>
                <li>???????????? ????????? ????????? ?????? ???????????? ?????? ?????????.</li>
                <br/>
                <li>???????????? ????????? ??????????????? ????????????, DB?????? ???????????????.</li>
                <li>????????? ???????????? ????????? ??????, ?????? ???????????? ????????? ?????? ?????????.</li>
                <li>?????? ????????? ????????? ????????? ???????????? ????????? ???????????????.</li>
                <li class="text-danger">????????? Channle ID ??? ???????????? ???????????????.</li>
                <br>

                <!-- Content Row -->
                <div class="row">
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">?????? ?????????</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <main id="lvChannel" class="text-center">
                                </main>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">?????? ??????</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <main class="text-center">
                                    <video id="remoteVideo" class="remote-video center w-300 h-300" autoplay controls
                                           playsinline
                                           style="z-index:1;background: rgba(0, 0, 0, 0.5); width: 100%;"></video>
                                    <video id="localVideo"
                                           style="z-index:2;position:absolute; bottom: 50px;right:30px;width:30%;border-radius: 10px;transform: rotateY(180deg);"
                                           autoplay muted>
                                    </video>
                                    <h6 id="waitingTv" class="m-0 font-weight-bold text-primary"
                                        style="z-index:3; position: absolute;bottom: 55px;right:45px; visibility: hidden;">
                                        waiting</h6>

                                    <input id="teacherNameInput" class="form-control text-center" type="text"
                                           placeholder="Please enter teacher name" autofocus>
                                    <a id="channelBtn" href="#"
                                       class="btn btn-primary btn-user btn-block text-center " style="visibility: hidden">
                                        CLOSE
                                    </a>
                                </main>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
            <!-- The webrtc adapter is required for browser compatibility -->
            <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@remotemonster/sdk/remon.min.js"></script>

            <script src="https://www.gstatic.com/firebasejs/7.8.2/firebase-app.js"></script>
            <script src="https://www.gstatic.com/firebasejs/7.8.2/firebase-analytics.js"></script>
            <script src="https://www.gstatic.com/firebasejs/7.8.2/firebase-database.js"></script>
            <!--<script src="/__/firebase/7.8.2/firebase-firestore.js"></script>-->
            <script>
                const localVideo = document.getElementById("localVideo");
                const channelBtnEl = document.querySelector('#channelBtn');
                const channelList = document.getElementById("lvChannel");
                const teacherNameInput = document.getElementById("teacherNameInput");
                const waitingTv = document.getElementById("waitingTv");
                let isConnected = false;
                let remon;
                const key = '990d79c9b998e2ad3ead9af9d8e1a01ecd80ab9c8b402d9f04563dcea3dbbe7a';
                const serviceId = '6452806a-283e-453f-a0df-88bb9de9e42c';
                let myChannelId;
                var waitingLoop;

                var firebaseConfig = {
                    apiKey: "AIzaSyD9iMEStu_af_x89fuFj-D_DoikBP5Ouj8",
                    authDomain: "remon-callkit.firebaseapp.com",
                    databaseURL: "https://remon-callkit.firebaseio.com",
                    projectId: "remon-callkit",
                    storageBucket: "remon-callkit.appspot.com",
                    messagingSenderId: "309346897312",
                    appId: "1:309346897312:web:0fa4fd4d70b550025928c5",
                    measurementId: "G-D7EFRVRWWP"
                };
                // Initialize Firebase
                firebase.initializeApp(firebaseConfig);
                firebase.analytics();
                var database = firebase.database();
                getStudentList();
                fetchInterval();

                // please register your own service key from remotemonster site.
                const config = {
                    credential: {
                        key, serviceId
                    },
                    view: {
                        remote: '#remoteVideo',
                        local: '#localVideo'
                    }
                };

                const listener = {
                    onConnect(chid) {
                        console.log(`EVENT FIRED: onConnect: ${chid}`);
                    },
                    onComplete() {
                        console.log('EVENT FIRED: onComplete');
                        setViewsViaParameters('visible', false, 'hidden', 'visible', 'hidden');
                    },
                    onDisconnectChannel() {
                        console.log('EVENT FIRED: onDisconnectChannel');
                        remon.close();
                        isConnected = false;
                        setViewsViaParameters('hidden', false, 'hidden', 'hidden', 'visible');
                    },
                    onClose() {
                        console.log('EVENT FIRED: onClose');
                        remon.close();
                        isConnected = false;
                        setViewsViaParameters('hidden', false, 'hidden', 'hidden', 'visible');
                    },
                    onError(error) {
                        console.log(`EVENT FIRED: onError: ${error}`);
                    },
                    onStat(result) {
                        console.log(`EVENT FIRED: onStat: ${result}`);
                    }
                };

                function setViewsViaParameters(localVideoVisibility, runWaitLoop, waitingTvVisibility, btnVisiblility, inputVisiblility) {
                    localVideo.style.visibility = localVideoVisibility;
                    if (runWaitLoop) {
                        waitingMsgLoop();
                    } else {
                        clearInterval(waitingLoop);
                    }
                    waitingTv.style.visibility = waitingTvVisibility;
                    channelBtnEl.style.visibility = btnVisiblility;
                    teacherNameInput.style.visibility = inputVisiblility;
                }

                function start() {
                    if (isConnected) {
                        isConnected = false;
                        setViewsViaParameters('hidden', false, 'hidden', 'hidden', 'visible');
                        remon.close();
                    } else {
                        isConnected = true;
                        setViewsViaParameters('visible', true, 'visible', 'visible', 'hidden');
                        remon = new Remon({config, listener});
                        remon.connectCall(myChannelId);
                    }
                }

                function getRandomId() {
                    var text = "";
                    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    for (var i = 0; i < 5; i++)
                        text += possible.charAt(Math.floor(Math.random() * possible.length));
                    return Date.now() + "_" + text;
                }

                channelBtnEl.addEventListener('click', (evt) => {
                    start();
                    evt.preventDefault();
                }, false);


                function waitingMsgLoop() {
                    var numOfPoint = 0;
                    var pointStr = "";
                    waitingLoop = setInterval(async function () {
                        pointStr = "";
                        numOfPoint++;
                        if (numOfPoint === 4) numOfPoint = 0;
                        for (var i = 0; i < numOfPoint; i++) {
                            pointStr += ".";
                        }
                        waitingTv.innerText = "waiting" + pointStr;
                    }, 1000);
                }

                function fetchInterval() {
                    setInterval(async function () {
                        while (channelList.firstChild) {
                            channelList.removeChild(channelList.firstChild);
                        }
                        getStudentList()
                    }, 3000);
                }
                function getStudentList() {
                    database.ref("account").once('value').then((snap) => {
                        if (snap.exists()) {
                            Object.keys(snap.val()).forEach((studentId) =>{
                                console.log(studentId)

                                var btn = document.createElement("input");
                                btn.type = "button";
                                btn.name = studentId;
                                btn.value = studentId;
                                btn.className = "btn btn-primary btn-user btn-block text-center";
                                btn.addEventListener('click', (evt) => {
                                    myChannelId = getRandomId();
                                    sendCall(studentId);
                                    start();
                                    evt.preventDefault();
                                }, false);
                                channelList.appendChild(btn);
                            });
                        } else {
                            console.log("no User")
                        }
                    })
                }

                function sendCall(studentId) {
                    $.ajax({
                        url: 'https://us-central1-remon-callkit.cloudfunctions.net/sendNotification',
                        type: 'POST',
                        data: {'teacherId': teacherNameInput.value, 'studentId': studentId, 'channelId': myChannelId}
                    }).then((data, textStatus, jqXHR) => {
                        console.log(data);
                    }, (jqXHR, textStatus, errorThrown) => {
                        /*pass*/
                    })
                }
            </script>
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; <a href='https://remotemonster.com'>RemoteMonster</a> 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-84812645-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'UA-84812645-1');
</script>
</body>

</html>
