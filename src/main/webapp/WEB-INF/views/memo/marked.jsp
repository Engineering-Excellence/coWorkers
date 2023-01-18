<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%-- 조우철 --%>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/alarm.jsp"%>
<c:set var="date" value="${Date(Date().getTime()-60*60*24*1000)}"/>
<c:set var="dday" value="${Date(Date().getTime()+60*60*24*1000)}"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">

                <table class="table" style="margin-left: auto; margin-right: auto;">
                    <tr class="bg-info">
                        <th colspan="10" style="font-size: 30px; text-align: center;">즐겨찾기</th>
                    </tr>

                    <tr class="bg-primary">
                        <th style="width: 150px; text-align: center;">보낸이</th>
                        <th style="width: 400px; text-align: center;">제목</th>
                        <th style="width: 300px; text-align: center;">작성일</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:set var="list" value="${memoMarkedList.list}"/>
                    <c:if test="${list.size() == 0}">
                        <tr>
                            <td colspan="10" align="center">
                                <img style="width: 350px" src="images/thief.png">
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${list.size() != 0}">
                        <c:forEach var="dto" items="${list}">

                            <tr>
                                <td style="text-align: center;">
                                    <c:set var="name" value="${fn:replace(dto.userName, '<', '&lt;')}"/>
                                    <c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
                                        ${name}
                                </td>
                                <td style="text-align: center;">
                                    <a href="markedView?memoID=${dto.memoID}">
                                        <c:set var="subject" value="${fn:replace(dto.subject, '<', '&lt;')}"/>
                                        <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                            ${subject}
                                    </a>
                                </td>
                                <td style="text-align: center;">${dto.writeDate}</td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <td colspan="9" align="center">

                        <c:if test="${memoMarkedList.currentPage>1}">
                            <input type="button" class="button" value="◀◀◀" title="첫 페이지로"
                                   onclick="location.href='?currentPage=1'">
                        </c:if>
                        <c:if test="${memoMarkedList.currentPage<=1}">
                            <input type="button" class="button2" disabled value="◀◀◀" title="현재 첫 페이지 입니다.">
                        </c:if>


                        <c:if test="${memoMarkedList.startPage>1}">
                            <input type="button" class="button" value="◀◀" title="이전 10 페이지로"
                                   onclick="location.href='?currentPage=${memoMarkedList.currentPage-10}'">
                        </c:if>
                        <c:if test="${memoMarkedList.startPage<=1}">
                            <input type="button" class="button2" disabled value="◀◀" title="현재 첫 10 페이지 입니다.">
                        </c:if>


                        <c:if test="${memoMarkedList.currentPage>1}">
                            <input type="button" class="button" value="◀" title="이전 페이지로"
                                   onclick="location.href='?currentPage=${memoMarkedList.currentPage-1}'">
                        </c:if>
                        <c:if test="${memoMarkedList.currentPage<=1}">
                            <input type="button" class="button2" disabled value="◀" title="현재 첫 페이지 입니다.">
                        </c:if>


                        <c:forEach var="i" begin="${memoMarkedList.startPage}" end="${memoMarkedList.endPage}" step="1">
                            <c:if test="${i==memoMarkedList.currentPage}">
                                <ruby>
                                    <b>[${i}]</b>
                                    <rt>▼</rt>
                                </ruby>
                            </c:if>
                            <c:if test="${i!=memoMarkedList.currentPage}">
                                <a href="?currentPage=${i}">[${i}]</a>
                            </c:if>
                        </c:forEach>


                        <c:if test="${memoMarkedList.currentPage<memoMarkedList.totalPage}">
                            <input type="button" class="button" value="▶" title="다음 페이지로"
                                   onclick="location.href='?currentPage=${memoMarkedList.currentPage+1}'">
                        </c:if>
                        <c:if test="${memoMarkedList.currentPage>=memoMarkedList.totalPage}">
                            <input type="button" class="button2" disabled value="▶" title="현재 마지막 페이지 입니다.">
                        </c:if>


                        <c:if test="${memoMarkedList.endPage<memoMarkedList.totalPage}">
                            <input type="button" class="button" value="▶▶" title="다음 10페이지로"
                                   onclick="location.href='?currentPage=${memoMarkedList.startPage+10}'">
                        </c:if>
                        <c:if test="${memoMarkedList.endPage>=memoMarkedList.totalPage}">
                            <input type="button" class="button2" disabled value="▶▶" title="현재 마지막 10 페이지 입니다.">
                        </c:if>


                        <c:if test="${memoMarkedList.currentPage<memoMarkedList.totalPage}">
                            <input type="button" class="button" value="▶▶▶" title="마지막 페이지로"
                                   onclick="location.href='?currentPage=${memoMarkedList.totalPage}'">
                        </c:if>
                        <c:if test="${memoMarkedList.currentPage>=memoMarkedList.totalPage}">
                            <input type="button" class="button2" disabled value="▶▶▶" title="현재 마지막 페이지 입니다.">
                        </c:if>
                    </td>
                    <tr>
                        <td align="right" colspan="10">
                            <input type="button" class="btn btn-outline-primary btn-sm" value="쪽지쓰기"
                                   onclick="location.href='memoInsert'">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/memo.js"></script>
</body>

</html>