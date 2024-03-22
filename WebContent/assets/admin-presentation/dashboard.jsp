<jsp:useBean id="bean" class="adminInitializationBean.AdminDashboardBean"></jsp:useBean>
<%
    session = request.getSession(false);
    int sales = (Integer)session.getAttribute("sales");
    int orders = (Integer)session.getAttribute("orders");
    int products = (Integer)session.getAttribute("products");
%>
<%@ page import="adminInitializationBean.Type" %>
<%
    Type java = bean.getJava();
    Type python = bean.getPython();
    Type cpp = bean.getCpp();
    Type c = bean.getC();
%>
<div class="overview d-flex">
    <div class="dash-head d-flex flex-column justify-content-between">
        <div class="head-name d-flex">
            <i class="fa-solid fa-indian-rupee-sign"></i>
            <span>SALES</span>
        </div>
        <div class="head-count">
            <span><%= sales %></span>
        </div>
    </div>
    <div class="dash-head d-flex flex-column justify-content-between">
        <div class="head-name d-flex">
            <i class="fa-solid fa-sort d-block"></i>
            <span>ORDERS</span>
        </div>
        <div class="head-count">
            <span><%= orders %></span>
        </div>
    </div>
    <div class="dash-head d-flex flex-column justify-content-between">
        <div class="head-name d-flex">
            <i class="fa-solid fa-cart-shopping"></i></i>
            <span>PRODUCTS</span>
        </div>
        <div class="head-count">
            <span><%= products %></span>
        </div>
    </div>
</div>
<div class="categories">
    <h1>Books Categories</h1>
    <div class="category-detail d-flex flex-column">
        <div class="d-flex justify-content-around">
            <div class="book-table col-6">
                <div class="book-name">
                    <span>JAVA</span>
                    <i class="fa-solid fa-arrow-right"></i>
                </div>
                <div class="table-data">
                    <table>
                        <tr>
                            <td>SOLD</td>
                            <td class="text-end"><%= java.getSold() %></td>
                        </tr>
                        <tr>
                            <td>ORDERS</td>
                            <td class="text-end"><%= java.getOrders() %></td>
                        </tr>
                        <tr>
                            <td>ACKNOWLEDGED</td>
                            <td class="text-end"><%= java.getAck() %></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="book-table col-6">
                <div class="book-name">
                    <span>PYTHON</span>
                    <i class="fa-solid fa-arrow-right"></i>
                </div>
                <div class="table-data">
                    <table>
                        <tr>
                            <td>SOLD</td>
                            <td class="text-end"><%= python.getSold() %></td>
                        </tr>
                        <tr>
                            <td>ORDERS</td>
                            <td class="text-end"><%= python.getOrders() %></td>
                        </tr>
                        <tr>
                            <td>ACKNOWLEDGED</td>
                            <td class="text-end"><%= python.getAck() %></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-around">
            <div class="book-table col-6">
                <div class="book-name">
                    <span>C++</span>
                    <i class="fa-solid fa-arrow-right"></i>
                </div>
                <div class="table-data">
                    <table>
                        <tr>
                            <td>SOLD</td>
                            <td class="text-end"><%= cpp.getSold() %></td>
                        </tr>
                        <tr>
                            <td>ORDERS</td>
                            <td class="text-end"><%= cpp.getOrders() %></td>
                        </tr>
                        <tr>
                            <td>ACKNOWLEDGED</td>
                            <td class="text-end"><%= cpp.getAck() %></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="book-table col-6">
                <div class="book-name">
                    <span>C</span>
                    <i class="fa-solid fa-arrow-right"></i>
                </div>
                <div class="table-data">
                    <table>
                        <tr>
                            <td>SOLD</td>
                            <td class="text-end"><%= c.getSold() %></td>
                        </tr>
                        <tr>
                            <td>ORDERS</td>
                            <td class="text-end"><%= c.getOrders() %></td>
                        </tr>
                        <tr>
                            <td>ACKNOWLEDGED</td>
                            <td class="text-end"><%= c.getAck() %></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>