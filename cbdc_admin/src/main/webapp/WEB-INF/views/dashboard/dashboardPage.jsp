<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/import/cbdcAdminCommonScript.jsp"/>
    <script>
    $(window).ready(function(){
        loading();
        setTimeout(function(){
            hideLoading();
            $(".mainDashboard").css('opacity','1');
        },1000);
   })
    </script>
</head>
<body>
    <div class="wrap">
        <c:import url="/WEB-INF/views/import/cbdcAdminTop.jsp" />
        <div class="content">
            <c:import url="/WEB-INF/views/import/cbdcAdminLeft.jsp" />
            <div class="mainContent nav-dash">
                <div class="innerCont">
                    <div class="contArea">
                        <div class="mainDashboard" style="opacity:0;">
                            <div class="searchArea">
                                <h1>Dashborad</h1>
                                <div class="btnArea pdt-0">
                                    <a href="#" onclick="location.reload(); return false;" class="button dashReset">reset</a>
                                </div>
                            </div>
                            <div class="dashboardArea pdb-0">
                                <div class="dashboardAreaTop">
                                    <div class="statusList">
                                        <ul>
                                            <li class="nodeSts nor">NOMARL</li>
                                            <li class="nodeSts war">WARN</li>
                                            <li class="nodeSts fat">FATAL</li>
                                            <li class="nodeTpye cn">CN</li>
                                            <li class="nodeTpye pn">PN</li>
                                            <li class="nodeTpye en">EN</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="dashboardArea">
                                <div class="dashboardAreaTop">
                                    <span>한국은행 <b>(3)</b></span>
                                </div>
                                <div class="nodeStausList">
                                    <ul>
                                        <li class="nodeStausListBox nor">
                                            <div class="nodeStausBox">
                                                <div class="nodeInfo">
                                                    <p class="nodeTpye cn"> BOK NODE #1</p>
                                                    <p class="blHeight">0,000,000</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="nodeStausListBox war">
                                            <div class="nodeStausBox">
                                                <div class="nodeInfo">
                                                    <p class="nodeTpye pn"> BOK NODE #1</p>
                                                    <p class="blHeight">0,000,000</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="nodeStausListBox fat">
                                            <div class="nodeStausBox">
                                                <div class="nodeInfo">
                                                    <p class="nodeTpye pn"> BOK NODE #1 </p>
                                                    <p class="blHeight">0,000,000</p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="dashboardArea">
                                <div class="dashboardAreaTop">
                                    <span>A은행 <b>(2)</b></span>
                                </div>
                                <div class="nodeStausList">
                                    <ul>
                                        <li class="nodeStausListBox nor">
                                            <div class="nodeStausBox">
                                                <div class="nodeInfo">
                                                    <p class="nodeTpye cn"> A Bank NODE #1</p>
                                                    <p class="blHeight">0,000,000</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="nodeStausListBox war">
                                            <div class="nodeStausBox">
                                                <div class="nodeInfo">
                                                    <p class="nodeTpye pn"> A Bank NODE #1</p>
                                                    <p class="blHeight">0,000,000</p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="dashboardArea">
                                <div class="dashboardAreaTop">
                                    <span class="title">거래량 (tx)</span>
                                </div>
                                <div class="txGrp">
                                    <div class="txGrpBox" id="txGrpBox"></div>
                                </div>
                            </div>
                            <div class="dashboardArea">
                                <div class="dashboardAreaTop">
                                    <span class="title">시스템</span>
                                </div>
                                <div class="searchArea">
                                    <div class="searchBox">
                                        <span>노드선택</span>
                                        <label class="text btnBox">
                                            <select>
                                                <option value="">Node #1</option>
                                                <option value="">Node #2</option>
                                                <option value="">Node #3</option>
                                            </select>
                                            <a href="#" class="searchBtn">검색</a>
                                        </label>
                                    </div>
                                    <div class="btnArea">
                                        <a href="#" target="_blank" class="button grafana">grafana</a>
                                    </div>
                                </div>
                                <div class="sysMonitoring">
                                    <ul>
                                        <li>
                                            <span>CPU 사용량</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>Memory 사용량</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>Disk 사용량</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>Disk I/O</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>네트워크 I/O</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>네트워크 사용량</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>Session</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>SQL 사용량</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>Dead Lock</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>TPS</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>Thread</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>Memory(Heap Usage, Heap Max)</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="dashboardArea">
                                <div class="dashboardAreaTop">
                                    <span class="title">분산원장</span>
                                </div>
                                <div class="sysMonitoring chain">
                                    <ul>
                                        <li>
                                            <span>초당 트랜잭션 처리 건수</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>초당 블록 생성 건수</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>노드별 연결 개수</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>블록 높이</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>평균 트랜잭션 크기</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>평균 블록 크기</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span>평균 트랜잭션 처리시간</span>
                                            <div class="setValue">
                                                <p class="viewValue">00.00</p>
                                                <p class="unit">(단위)</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer>
                    <span class="btmCp">Bank of Korea ⓒ 2021</span>
                </footer>
            </div>
        </div>
    </div>

    <style>
        .u-legend{
            width:130px;
        }

        .u-legend div,
        .u-legend td{
            color:#fff !important;
        }
    </style>

    <script>
        var getW = $(".txGrpBox").width();

        $(window).ready(function(){
            drawGrap();
        });

        $(window).resize(function(){
            $("#txGrpBox").html('');
            getW = $(".txGrpBox").width();
            drawGrap();
        });

        function legendAsTooltipPlugin({ className, style = { backgroundColor:"rgba(0,0,0,1)", color: "#fff" } } = {}) {
            let legendEl;

            function init(u, opts) {
                legendEl = u.root.querySelector(".u-legend");

                legendEl.classList.remove("u-inline");
                className && legendEl.classList.add(className);

                uPlot.assign(legendEl.style, {
                    textAlign: "left",
                    pointerEvents: "none",
                    display: "none",
                    position: "absolute",
                    left: 0,
                    top: 0,
                    zIndex: 100,
                    width: 150,
                    boxShadow: "2px 2px 10px rgba(0,0,0,0.5)",
                    ...style
                });

                // hide series color markers
                const idents = legendEl.querySelectorAll(".u-marker");

                for (let i = 0; i < idents.length; i++)
                    idents[i].style.display = "none";

                const overEl = u.over;
                overEl.style.overflow = "visible";

                // move legend into plot bounds
                overEl.appendChild(legendEl);

                // show/hide tooltip on enter/exit
                overEl.addEventListener("mouseenter", () => {legendEl.style.display = null;});
                overEl.addEventListener("mouseleave", () => {legendEl.style.display = "none";});

                // let tooltip exit plot
            //	overEl.style.overflow = "visible";
            }

            function update(u) {
                const { left, top } = u.cursor;
                legendEl.style.transform = "translate(" + left + "px, " + top + "px)";
            }

            return {
                hooks: {
                    init: init,
                    setCursor: update,
                }
            };
        }

        function drawGrap(){
            const opts = {
                id: "chart",
                // title: "placement.js tooltip",
                width: getW,
                height: 400,
                plugins: [
                    legendAsTooltipPlugin(),
                ],
                axes: [
                    {
                        stroke: "#c7d0d9",
                        grid: {
                            width: 0.5,
                            stroke: "rgba(255,255,255,0.3)",
                        },
                    },
                    {
                        stroke: "#c7d0d9",
                        grid: {
                            width: 0.5,
                            stroke: "rgba(255,255,255,0.3)",
                        },
                    },
                ],
                scales: {
                    x: {
                        time: false,
                    }
                },
                series: [
                    {
                        label: "시간"
                    },
                    {
                        label: "거래량(tx)",
                        width: 1,
                        stroke: "#1F78C1",
                        fill: "#1F78C11A"
                    }
                ]
            };

            const data = [
                [ 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],
                [495,485,482,498,487,493,490,489,495,488,486,480,496,494,499,479,500,487]
            ];

            const u = new uPlot(opts, data, document.getElementById('txGrpBox'));
        }


    </script>

</body>
</html>